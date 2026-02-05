import 'package:flutter_test/flutter_test.dart';
import 'package:real_time_quiz/features/quiz/data/mappers/quiz_mappers.dart';
import 'package:real_time_quiz/features/quiz/data/models/game_state_dto.dart';
import 'package:real_time_quiz/features/quiz/data/models/participant_dto.dart';
import 'package:real_time_quiz/features/quiz/data/models/question_dto.dart';
import 'package:real_time_quiz/features/quiz/data/models/quiz_answer_dto.dart';
import 'package:real_time_quiz/features/quiz/data/models/quiz_config_dto.dart';
import 'package:real_time_quiz/features/quiz/data/models/quiz_dto.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/game_state.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/participant.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/question.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_answer.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_config.dart';

void main() {
  group('QuizMappers', () {
    test('quizStatusFromString converts correctly', () {
      expect(quizStatusFromString('waiting'), QuizStatus.waiting);
      expect(quizStatusFromString('inProgress'), QuizStatus.inProgress);
      expect(quizStatusFromString('finished'), QuizStatus.finished);
      expect(quizStatusFromString('unknown'), QuizStatus.waiting);
    });

    test('quizStatusToString converts correctly', () {
      expect(quizStatusToString(QuizStatus.waiting), 'waiting');
      expect(quizStatusToString(QuizStatus.inProgress), 'inProgress');
      expect(quizStatusToString(QuizStatus.finished), 'finished');
    });

    test('QuizConfig mapping', () {
      const dto = QuizConfigDto(
        hostId: 'h1',
        status: 'waiting',
        questionDuration: 20,
      );
      final domain = dto.toDomain();
      expect(domain.hostId, 'h1');
      expect(domain.status, QuizStatus.waiting);
      expect(domain.questionDuration, 20);

      final backToDto = domain.toDto();
      expect(backToDto, dto);
    });

    test('GameState mapping', () {
      const dto = GameStateDto(
        currentQuestionIndex: 5,
        questionStartedAt: 1000,
      );
      final domain = dto.toDomain();
      expect(domain.currentQuestionIndex, 5);
      expect(domain.questionStartedAt, 1000);

      final backToDto = domain.toDto();
      expect(backToDto, dto);
    });

    test('Question mapping', () {
      const dto = QuestionDto(text: 'Q', options: ['A', 'B'], correctIndex: 1);
      final domain = dto.toDomain();
      expect(domain.text, 'Q');
      expect(domain.options, ['A', 'B']);
      expect(domain.correctIndex, 1);

      final backToDto = domain.toDto();
      expect(backToDto, dto);
    });

    test('Participant mapping', () {
      const dto = ParticipantDto(name: 'User', score: 100);
      final domain = dto.toDomain('uid1');
      expect(domain.userId, 'uid1');
      expect(domain.name, 'User');
      expect(domain.score, 100);

      final backToDto = domain.toDto();
      expect(backToDto, dto);
    });

    test('QuizAnswer mapping', () {
      const dto = QuizAnswerDto(
        questionIndex: 1,
        selectedOptionIndex: 2,
        answeredAt: 500,
      );
      final domain = dto.toDomain();
      expect(domain.questionIndex, 1);
      expect(domain.selectedOptionIndex, 2);
      expect(domain.answeredAt, 500);

      final backToDto = domain.toDto();
      expect(backToDto, dto);
    });

    test('Quiz mapping', () {
      const dto = QuizDto(
        config: QuizConfigDto(hostId: 'h1', status: 'waiting'),
        gameState: GameStateDto(currentQuestionIndex: -1, questionStartedAt: 0),
        questions: {
          '0': QuestionDto(text: 'Q0', options: ['A'], correctIndex: 0),
          '1': QuestionDto(text: 'Q1', options: ['B'], correctIndex: 0),
        },
      );

      final domain = dto.toDomain('quiz123');
      expect(domain.quizId, 'quiz123');
      expect(domain.questions.length, 2);
      expect(domain.questions[0].text, 'Q0');
      expect(domain.questions[1].text, 'Q1');

      final backToDto = domain.toDto();
      expect(backToDto.config, dto.config);
      expect(backToDto.gameState, dto.gameState);
      expect(backToDto.questions['0'], dto.questions['0']);
      expect(backToDto.questions['1'], dto.questions['1']);
    });
  });
}
