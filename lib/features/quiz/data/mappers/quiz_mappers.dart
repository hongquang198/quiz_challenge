import '../../domain/entities/answer_submission.dart';
import '../../domain/entities/game_state.dart';
import '../../domain/entities/participant.dart';
import '../../domain/entities/question.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/entities/quiz_answer.dart';
import '../../domain/entities/quiz_config.dart';
import '../models/game_state_dto.dart';
import '../models/participant_dto.dart';
import '../models/question_dto.dart';
import '../models/quiz_answer_dto.dart';
import '../models/quiz_config_dto.dart';
import '../models/quiz_dto.dart';

QuizStatus quizStatusFromString(String value) {
  switch (value) {
    case 'waiting':
      return QuizStatus.waiting;
    case 'inProgress':
      return QuizStatus.inProgress;
    case 'finished':
      return QuizStatus.finished;
    default:
      return QuizStatus.waiting;
  }
}

String quizStatusToString(QuizStatus status) {
  switch (status) {
    case QuizStatus.waiting:
      return 'waiting';
    case QuizStatus.inProgress:
      return 'inProgress';
    case QuizStatus.finished:
      return 'finished';
  }
}

extension QuizConfigDtoX on QuizConfigDto {
  QuizConfig toDomain() => QuizConfig(
        hostId: hostId,
        status: quizStatusFromString(status),
        questionDuration: questionDuration,
      );
}

extension QuizConfigX on QuizConfig {
  QuizConfigDto toDto() => QuizConfigDto(
        hostId: hostId,
        status: quizStatusToString(status),
        questionDuration: questionDuration,
      );
}

extension GameStateDtoX on GameStateDto {
  GameState toDomain() => GameState(
        currentQuestionIndex: currentQuestionIndex,
        questionStartedAt: questionStartedAt,
      );
}

extension GameStateX on GameState {
  GameStateDto toDto() => GameStateDto(
        currentQuestionIndex: currentQuestionIndex,
        questionStartedAt: questionStartedAt,
      );
}

extension QuestionDtoX on QuestionDto {
  Question toDomain() => Question(text: text, options: options, correctIndex: correctIndex);
}

extension QuestionX on Question {
  QuestionDto toDto() => QuestionDto(text: text, options: options, correctIndex: correctIndex);
}

extension ParticipantDtoX on ParticipantDto {
  Participant toDomain(String userId) => Participant(userId: userId, name: name, score: score);
}

extension ParticipantX on Participant {
  ParticipantDto toDto() => ParticipantDto(name: name, score: score);
}

extension QuizAnswerDtoX on QuizAnswerDto {
  QuizAnswer toDomain() => QuizAnswer(
        questionIndex: questionIndex,
        selectedOptionIndex: selectedOptionIndex,
        answeredAt: answeredAt,
      );
}

extension QuizAnswerX on QuizAnswer {
  QuizAnswerDto toDto() => QuizAnswerDto(
        questionIndex: questionIndex,
        selectedOptionIndex: selectedOptionIndex,
        answeredAt: answeredAt,
      );
}

extension QuizDtoX on QuizDto {
  Quiz toDomain(String quizId) {
    final ordered = questions.entries.toList()
      ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key)));
    final q = ordered.map((e) => e.value.toDomain()).toList(growable: false);

    return Quiz(
      quizId: quizId,
      config: config.toDomain(),
      gameState: gameState.toDomain(),
      questions: q,
    );
  }
}

extension QuizX on Quiz {
  QuizDto toDto() {
    final mapped = <String, QuestionDto>{};
    for (var i = 0; i < questions.length; i++) {
      mapped['$i'] = questions[i].toDto();
    }
    return QuizDto(config: config.toDto(), gameState: gameState.toDto(), questions: mapped);
  }
}

AnswerSubmission answerSubmissionFromDto({
  required String userId,
  required QuizAnswerDto dto,
}) =>
    AnswerSubmission(userId: userId, answer: dto.toDomain());

