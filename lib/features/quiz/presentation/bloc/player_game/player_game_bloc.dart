import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../../../../core/domain/repositories/auth_repository.dart';
import '../../../domain/entities/game_state.dart';
import '../../../domain/entities/participant.dart';
import '../../../domain/entities/question.dart';
import '../../../domain/entities/quiz.dart';
import '../../../domain/entities/quiz_answer.dart';
import '../../../domain/entities/quiz_config.dart';
import '../../../domain/repositories/quiz_repository.dart';
import '../../../domain/repositories/time_sync_repository.dart';

part 'player_game_bloc.freezed.dart';
part 'player_game_event.dart';
part 'player_game_state.dart';

@injectable
class PlayerGameBloc extends Bloc<PlayerGameEvent, PlayerGameState> {
  PlayerGameBloc(
    this._authRepository,
    this._quizRepository,
    this._timeSyncRepository,
  ) : super(const PlayerGameState.initial()) {
    on<PlayerJoinRequested>(_onJoinRequested);
    on<PlayerGameQuizUpdated>(_onQuizUpdated);
    on<PlayerGameParticipantsUpdated>(_onParticipantsUpdated);
    on<PlayerAnswerSelected>(_onAnswerSelected);
    on<PlayerGameServerOffsetUpdated>(_onServerOffsetUpdated);
    on<PlayerGameTick>(_onTick);
  }

  final AuthRepository _authRepository;
  final QuizRepository _quizRepository;
  final TimeSyncRepository _timeSyncRepository;

  StreamSubscription<Quiz>? _quizSub;
  StreamSubscription<List<Participant>>? _participantsSub;
  StreamSubscription<int>? _offsetSub;
  Timer? _timer;

  int _serverOffsetMillis = 0;

  Future<void> _onJoinRequested(
    PlayerJoinRequested event,
    Emitter<PlayerGameState> emit,
  ) async {
    await _quizSub?.cancel();
    await _participantsSub?.cancel();
    await _offsetSub?.cancel();
    _timer?.cancel();

    emit(const PlayerGameState.loading());

    try {
      final userId = await _ensureSignedIn();
      if (isClosed) return;

      // Check if the user is the host of this quiz
      try {
        final quiz = await _quizRepository
            .watchQuiz(quizId: event.quizId)
            .first
            .timeout(const Duration(seconds: 3));

        if (quiz.config.hostId == userId) {
          // User is the host, redirect to host flow
          emit(PlayerGameState.redirectToHost(quizId: event.quizId));
          return;
        }
      } catch (_) {
        // If we can't check (quiz doesn't exist, timeout, etc.),
        // proceed with normal join which will handle the error
      }

      await _quizRepository.joinQuiz(
        quizId: event.quizId,
        userId: userId,
        displayName: event.displayName,
      );
      if (isClosed) return;

      _offsetSub = _timeSyncRepository.watchServerTimeOffsetMillis().listen(
        (offset) => add(PlayerGameServerOffsetUpdated(offset)),
      );

      final quizSub = _quizRepository.watchQuiz(quizId: event.quizId).listen((
        quiz,
      ) {
        add(PlayerGameQuizUpdated(quiz));
      });

      if (isClosed) {
        await quizSub.cancel();
        return;
      }
      _quizSub = quizSub;

      _participantsSub = _quizRepository
          .watchParticipants(quizId: event.quizId)
          .listen((p) => add(PlayerGameParticipantsUpdated(p)));

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => add(const PlayerGameTick()),
      );
    } on AppFailure catch (e) {
      emit(PlayerGameState.failure(message: e.toString()));
    } catch (e) {
      emit(PlayerGameState.failure(message: e.toString()));
    }
  }

  void _onQuizUpdated(
    PlayerGameQuizUpdated event,
    Emitter<PlayerGameState> emit,
  ) {
    final quiz = event.quiz;
    final current = state;
    final participants =
        current is PlayerGameLoaded ? current.participants : <Participant>[];

    // Check if we moved to a new question
    bool hasAnswered = false;
    int? selectedOptionIndex;

    if (current is PlayerGameLoaded) {
      if (current.gameState.currentQuestionIndex ==
          quiz.gameState.currentQuestionIndex) {
        // Same question, preserve answer status
        hasAnswered = current.hasAnsweredCurrentQuestion;
        selectedOptionIndex = current.selectedOptionIndex;
      } else {
        // New question (or first load), reset answer status
        hasAnswered = false;
        selectedOptionIndex = null;
      }
    }

    if (quiz.config.status == QuizStatus.finished) {
      _timer?.cancel();
    }

    emit(
      PlayerGameLoaded(
        quizId: quiz.quizId,
        status: quiz.config.status,
        gameState: quiz.gameState,
        questions: quiz.questions,
        participants: participants,
        selfId: _authRepository.currentUserId() ?? '',
        questionDurationSeconds: quiz.config.questionDuration,
        secondsRemaining: _computeSecondsRemaining(
          gameState: quiz.gameState,
          questionDurationSeconds: quiz.config.questionDuration,
        ),
        hasAnsweredCurrentQuestion: hasAnswered,
        selectedOptionIndex: selectedOptionIndex,
        errorMessage: null,
      ),
    );
  }

  void _onParticipantsUpdated(
    PlayerGameParticipantsUpdated event,
    Emitter<PlayerGameState> emit,
  ) {
    final current = state;
    if (current is! PlayerGameLoaded) return;
    emit(current.copyWith(participants: event.participants));
  }

  Future<void> _onAnswerSelected(
    PlayerAnswerSelected event,
    Emitter<PlayerGameState> emit,
  ) async {
    final current = state;
    if (current is! PlayerGameLoaded) return;
    if (current.hasAnsweredCurrentQuestion) return;
    if (current.status != QuizStatus.inProgress) return;

    final questionIndex = current.gameState.currentQuestionIndex;
    if (questionIndex < 0 || questionIndex >= current.questions.length) return;

    try {
      final userId = await _ensureSignedIn();
      final answer = QuizAnswer(
        questionIndex: questionIndex,
        selectedOptionIndex: event.selectedOptionIndex,
        answeredAt: _serverNowMillis(),
      );
      await _quizRepository.submitAnswer(
        quizId: current.quizId,
        userId: userId,
        answer: answer,
      );

      emit(
        current.copyWith(
          hasAnsweredCurrentQuestion: true,
          selectedOptionIndex: event.selectedOptionIndex,
        ),
      );
    } on AppFailure catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    } catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    }
  }

  void _onServerOffsetUpdated(
    PlayerGameServerOffsetUpdated event,
    Emitter<PlayerGameState> emit,
  ) {
    _serverOffsetMillis = event.offsetMillis;
  }

  void _onTick(PlayerGameTick event, Emitter<PlayerGameState> emit) {
    final current = state;
    if (current is! PlayerGameLoaded || current.status == QuizStatus.finished) {
      _timer?.cancel();
      return;
    }

    final secondsRemaining = _computeSecondsRemaining(
      gameState: current.gameState,
      questionDurationSeconds: current.questionDurationSeconds,
    );
    emit(current.copyWith(secondsRemaining: secondsRemaining));
  }

  int _computeSecondsRemaining({
    required GameState gameState,
    required int questionDurationSeconds,
  }) {
    if (gameState.currentQuestionIndex < 0 ||
        gameState.questionStartedAt <= 0) {
      return questionDurationSeconds;
    }
    final now = _serverNowMillis();
    final elapsedMillis = now - gameState.questionStartedAt;
    final elapsedSeconds = (elapsedMillis / 1000).floor();
    final remaining = (questionDurationSeconds - elapsedSeconds).clamp(
      0,
      questionDurationSeconds,
    );
    return remaining;
  }

  Future<String> _ensureSignedIn() async {
    final existing = _authRepository.currentUserId();
    if (existing != null) return existing;
    return _authRepository.signInAnonymously();
  }

  int _serverNowMillis() =>
      DateTime.now().millisecondsSinceEpoch + _serverOffsetMillis;

  @override
  Future<void> close() async {
    await _quizSub?.cancel();
    await _participantsSub?.cancel();
    await _offsetSub?.cancel();
    _timer?.cancel();
    return super.close();
  }
}
