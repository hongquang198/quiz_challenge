part of 'host_game_bloc.dart';

@freezed
class HostGameState with _$HostGameState {
  const factory HostGameState.initial() = HostGameInitial;

  const factory HostGameState.loading({required String quizId}) =
      HostGameLoading;

  const factory HostGameState.loaded({
    required String quizId,
    required QuizStatus status,
    required GameState gameState,
    required List<Question> questions,
    required List<Participant> participants,
    required int questionDurationSeconds,
    String? errorMessage,
  }) = HostGameLoaded;
}
