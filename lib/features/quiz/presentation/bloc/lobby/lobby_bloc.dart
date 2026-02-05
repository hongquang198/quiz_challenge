import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/participant.dart';
import '../../../domain/entities/quiz.dart';
import '../../../domain/repositories/quiz_repository.dart';

part 'lobby_bloc.freezed.dart';
part 'lobby_event.dart';
part 'lobby_state.dart';

@injectable
class LobbyBloc extends Bloc<LobbyEvent, LobbyState> {
  LobbyBloc(this._quizRepository) : super(const LobbyState.initial()) {
    on<LobbyStarted>(_onStarted);
    on<LobbyParticipantsUpdated>(_onParticipantsUpdated);
    on<LobbyQuizUpdated>(_onQuizUpdated);
  }

  final QuizRepository _quizRepository;
  StreamSubscription<List<Participant>>? _participantsSub;
  StreamSubscription<Quiz>? _quizSub;

  Future<void> _onStarted(LobbyStarted event, Emitter<LobbyState> emit) async {
    await _participantsSub?.cancel();
    await _quizSub?.cancel();

    emit(const LobbyState.loading());

    _participantsSub = _quizRepository
        .watchParticipants(quizId: event.quizId)
        .listen((participants) => add(LobbyParticipantsUpdated(participants)));

    _quizSub = _quizRepository
        .watchQuiz(quizId: event.quizId)
        .listen((quiz) => add(LobbyQuizUpdated(quiz)));
  }

  Future<void> _onParticipantsUpdated(
    LobbyParticipantsUpdated event,
    Emitter<LobbyState> emit,
  ) async {
    emit(LobbyState.loaded(participants: event.participants));
  }

  Future<void> _onQuizUpdated(
    LobbyQuizUpdated event,
    Emitter<LobbyState> emit,
  ) async {
    emit(
      LobbyState.loaded(
        participants: state.maybeMap(
          loaded: (s) => s.participants,
          orElse: () => [],
        ),
        quiz: event.quiz,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _participantsSub?.cancel();
    await _quizSub?.cancel();
    return super.close();
  }
}
