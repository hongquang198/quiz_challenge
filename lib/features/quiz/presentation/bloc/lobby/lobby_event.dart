part of 'lobby_bloc.dart';

@freezed
class LobbyEvent with _$LobbyEvent {
  const factory LobbyEvent.started({required String quizId}) = LobbyStarted;
  const factory LobbyEvent.participantsUpdated(List<Participant> participants) =
      LobbyParticipantsUpdated;
  const factory LobbyEvent.quizUpdated(Quiz quiz) = LobbyQuizUpdated;
}

