import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../../domain/entities/answer_submission.dart';
import '../../../domain/entities/game_state.dart';
import '../../../domain/entities/participant.dart';
import '../../../domain/entities/question.dart';
import '../../../domain/entities/quiz.dart';
import '../../../domain/entities/quiz_config.dart';
import '../../../domain/repositories/quiz_repository.dart';
import '../../../domain/repositories/time_sync_repository.dart';

part 'host_game_bloc.freezed.dart';
part 'host_game_event.dart';
part 'host_game_state.dart';

@injectable
class HostGameBloc extends Bloc<HostGameEvent, HostGameState> {
  HostGameBloc(this._quizRepository, this._timeSyncRepository)
    : super(const HostGameState.initial()) {
    on<HostGameStarted>(_onStarted);
    on<HostStartGame>(_onStartGame);
    on<HostNextQuestionRequested>(_onNextQuestionRequested);
    on<HostGameQuizUpdated>(_onQuizUpdated);
    on<HostGameAnswerReceived>(_onAnswerReceived);
    on<HostGameServerOffsetUpdated>(_onServerOffsetUpdated);
  }

  final QuizRepository _quizRepository;
  final TimeSyncRepository _timeSyncRepository;

  StreamSubscription<Quiz>? _quizSub;
  StreamSubscription<AnswerSubmission>? _answersSub;
  StreamSubscription<int>? _offsetSub;

  int _serverOffsetMillis = 0;

  Future<void> _onStarted(
    HostGameStarted event,
    Emitter<HostGameState> emit,
  ) async {
    await _quizSub?.cancel();
    await _answersSub?.cancel();
    await _offsetSub?.cancel();

    emit(HostGameState.loading(quizId: event.quizId));

    _offsetSub = _timeSyncRepository.watchServerTimeOffsetMillis().listen(
      (offset) => add(HostGameServerOffsetUpdated(offset)),
    );

    _quizSub = _quizRepository.watchQuiz(quizId: event.quizId).listen((quiz) {
      add(HostGameQuizUpdated(quiz));
    });
  }

  Future<void> _onStartGame(
    HostStartGame event,
    Emitter<HostGameState> emit,
  ) async {
    final current = state;
    if (current is! HostGameLoaded) {
      return;
    }

    try {
      await _quizRepository.startGame(quizId: current.quizId);
    } on AppFailure catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    } catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> _onNextQuestionRequested(
    HostNextQuestionRequested event,
    Emitter<HostGameState> emit,
  ) async {
    final current = state;
    if (current is! HostGameLoaded) return;

    final nextIndex = current.gameState.currentQuestionIndex + 1;
    if (nextIndex >= current.questions.length) {
      // No more questions: finish game.
      try {
        await _quizRepository.finishGame(quizId: current.quizId);
      } on AppFailure catch (e) {
        emit(current.copyWith(errorMessage: e.toString()));
      } catch (e) {
        emit(current.copyWith(errorMessage: e.toString()));
      }
      return;
    }

    final serverNow = _serverNowMillis();
    try {
      // Update game state in RTDB.
      await _quizRepository.setCurrentQuestionIndex(
        quizId: current.quizId,
        currentQuestionIndex: nextIndex,
        questionStartedAt: serverNow,
      );
    } on AppFailure catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    } catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    }
  }

  void _onQuizUpdated(HostGameQuizUpdated event, Emitter<HostGameState> emit) {
    final quiz = event.quiz;
    final current = state;
    final participants =
        <Participant>[]; // host UI can combine with LobbyBloc if needed.

    final int oldIndex =
        current is HostGameLoaded ? current.gameState.currentQuestionIndex : -2;
    final int newIndex = quiz.gameState.currentQuestionIndex;

    // Manage answer listener based on index changes
    if (newIndex != oldIndex &&
        newIndex >= 0 &&
        quiz.config.status == QuizStatus.inProgress) {
      _answersSub?.cancel();
      _answersSub = _quizRepository
          .watchAnswerSubmissionsForQuestion(
            quizId: quiz.quizId,
            questionIndex: newIndex,
          )
          .listen((submission) => add(HostGameAnswerReceived(submission)));
    }

    final loaded = HostGameLoaded(
      quizId: quiz.quizId,
      status: quiz.config.status,
      gameState: quiz.gameState,
      questions: quiz.questions,
      participants: participants,
      questionDurationSeconds: quiz.config.questionDuration,
      errorMessage: null,
    );
    emit(loaded);
  }

  Future<void> _onAnswerReceived(
    HostGameAnswerReceived event,
    Emitter<HostGameState> emit,
  ) async {
    final current = state;
    if (current is! HostGameLoaded) return;

    final submission = event.submission;
    final questionIndex = submission.answer.questionIndex;

    if (questionIndex < 0 || questionIndex >= current.questions.length) {
      return;
    }

    final question = current.questions[questionIndex];
    final durationSeconds = current.questionDurationSeconds;

    final serverNow = _serverNowMillis();
    final elapsedMillis = serverNow - current.gameState.questionStartedAt;
    final elapsedSeconds = (elapsedMillis / 1000).floor();
    final remaining =
        (durationSeconds - elapsedSeconds).clamp(0, durationSeconds).toInt();

    final isCorrect =
        submission.answer.selectedOptionIndex == question.correctIndex;
    final points = isCorrect ? 100 + (remaining * 10) : 0;
    if (points <= 0) return;

    try {
      await _quizRepository.awardPointsOnce(
        quizId: current.quizId,
        questionIndex: questionIndex,
        userId: submission.userId,
        points: points,
      );
    } on AppFailure catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    } catch (e) {
      emit(current.copyWith(errorMessage: e.toString()));
    }
  }

  void _onServerOffsetUpdated(
    HostGameServerOffsetUpdated event,
    Emitter<HostGameState> emit,
  ) {
    _serverOffsetMillis = event.offsetMillis;
  }

  int _serverNowMillis() =>
      DateTime.now().millisecondsSinceEpoch + _serverOffsetMillis;

  @override
  Future<void> close() async {
    await _quizSub?.cancel();
    await _answersSub?.cancel();
    await _offsetSub?.cancel();
    return super.close();
  }
}
