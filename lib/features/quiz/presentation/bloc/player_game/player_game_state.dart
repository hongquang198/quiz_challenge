part of 'player_game_bloc.dart';

@freezed
class PlayerGameState with _$PlayerGameState {
  const factory PlayerGameState.initial() = PlayerGameInitial;

  const factory PlayerGameState.loading() = PlayerGameLoading;

  const factory PlayerGameState.loaded({
    required String quizId,
    required QuizStatus status,
    required GameState gameState,
    required List<Question> questions,
    required List<Participant> participants,
    required String selfId,
    required int questionDurationSeconds,
    required int secondsRemaining,
    required bool hasAnsweredCurrentQuestion,
    int? selectedOptionIndex,
    String? errorMessage,
  }) = PlayerGameLoaded;

  const factory PlayerGameState.failure({required String message}) =
      PlayerGameFailure;

  const factory PlayerGameState.redirectToHost({required String quizId}) =
      PlayerGameRedirectToHost;
}
