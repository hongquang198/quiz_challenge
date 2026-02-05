part of 'host_game_bloc.dart';

@freezed
sealed class HostGameEvent with _$HostGameEvent {
  const factory HostGameEvent.started({required String quizId}) =
      HostGameStarted;

  const factory HostGameEvent.nextQuestionRequested() =
      HostNextQuestionRequested;
  const factory HostGameEvent.startGame() = HostStartGame;

  // Internal events from streams.
  const factory HostGameEvent.quizUpdated(Quiz quiz) = HostGameQuizUpdated;
  const factory HostGameEvent.answerReceived(AnswerSubmission submission) =
      HostGameAnswerReceived;
  const factory HostGameEvent.serverOffsetUpdated(int offsetMillis) =
      HostGameServerOffsetUpdated;
}
