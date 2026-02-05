part of 'player_game_bloc.dart';

@freezed
sealed class PlayerGameEvent with _$PlayerGameEvent {
  const factory PlayerGameEvent.joinRequested({
    required String quizId,
    required String displayName,
  }) = PlayerJoinRequested;

  const factory PlayerGameEvent.answerSelected({
    required int selectedOptionIndex,
  }) = PlayerAnswerSelected;

  // Internal
  const factory PlayerGameEvent.quizUpdated(Quiz quiz) = PlayerGameQuizUpdated;
  const factory PlayerGameEvent.participantsUpdated(List<Participant> participants) =
      PlayerGameParticipantsUpdated;
  const factory PlayerGameEvent.serverOffsetUpdated(int offsetMillis) =
      PlayerGameServerOffsetUpdated;
  const factory PlayerGameEvent.tick() = PlayerGameTick;
}

