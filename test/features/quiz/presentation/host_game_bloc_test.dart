import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/answer_submission.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/game_state.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/question.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_answer.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_config.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/time_sync_repository.dart';
import 'package:real_time_quiz/features/quiz/presentation/bloc/host_game/host_game_bloc.dart';

class _MockQuizRepository extends Mock implements QuizRepository {}

class _MockTimeSyncRepository extends Mock implements TimeSyncRepository {}

void main() {
  group('HostGameBloc', () {
    late _MockQuizRepository quizRepository;
    late _MockTimeSyncRepository timeSyncRepository;
    const quizId = 'ABC123';

    setUp(() {
      quizRepository = _MockQuizRepository();
      timeSyncRepository = _MockTimeSyncRepository();

      when(
        () => timeSyncRepository.watchServerTimeOffsetMillis(),
      ).thenAnswer((_) => Stream.value(0));
    });

    blocTest<HostGameBloc, HostGameState>(
      'HostGameStarted emits loading and watches quiz/offset',
      build: () {
        when(
          () => quizRepository.watchQuiz(quizId: quizId),
        ).thenAnswer((_) => const Stream.empty());
        return HostGameBloc(quizRepository, timeSyncRepository);
      },
      act: (bloc) => bloc.add(const HostGameStarted(quizId: quizId)),
      expect: () => [const HostGameState.loading(quizId: quizId)],
      verify: (_) {
        verify(() => quizRepository.watchQuiz(quizId: quizId)).called(1);
        verify(
          () => timeSyncRepository.watchServerTimeOffsetMillis(),
        ).called(1);
      },
    );

    blocTest<HostGameBloc, HostGameState>(
      'HostStartGame calls repository',
      build: () => HostGameBloc(quizRepository, timeSyncRepository),
      seed:
          () => const HostGameState.loaded(
            quizId: quizId,
            status: QuizStatus.waiting,
            gameState: GameState(
              currentQuestionIndex: -1,
              questionStartedAt: 0,
            ),
            questions: [],
            participants: [],
            questionDurationSeconds: 15,
          ),
      act: (bloc) {
        when(
          () => quizRepository.startGame(quizId: quizId),
        ).thenAnswer((_) async => null);
        return bloc.add(const HostStartGame());
      },
      verify: (_) {
        verify(() => quizRepository.startGame(quizId: quizId)).called(1);
      },
    );

    blocTest<HostGameBloc, HostGameState>(
      'HostGameAnswerReceived awards points correctly',
      build: () => HostGameBloc(quizRepository, timeSyncRepository),
      seed:
          () => const HostGameState.loaded(
            quizId: quizId,
            status: QuizStatus.inProgress,
            gameState: GameState(
              currentQuestionIndex: 0,
              questionStartedAt: 1000,
            ),
            questions: [
              Question(text: 'Q1', options: ['A', 'B'], correctIndex: 0),
            ],
            participants: [],
            questionDurationSeconds: 15,
          ),
      act: (bloc) {
        when(
          () => quizRepository.awardPointsOnce(
            quizId: any(named: 'quizId'),
            questionIndex: any(named: 'questionIndex'),
            userId: any(named: 'userId'),
            points: any(named: 'points'),
          ),
        ).thenAnswer((_) async => true);

        return bloc.add(
          const HostGameAnswerReceived(
            AnswerSubmission(
              userId: 'u1',
              answer: QuizAnswer(
                questionIndex: 0,
                selectedOptionIndex: 0,
                answeredAt: 2000,
              ),
            ),
          ),
        );
      },
      verify: (_) {
        verify(
          () => quizRepository.awardPointsOnce(
            quizId: quizId,
            questionIndex: 0,
            userId: 'u1',
            points: any(named: 'points'),
          ),
        ).called(1);
      },
    );

    blocTest<HostGameBloc, HostGameState>(
      'HostNextQuestionRequested advances question index',
      build: () => HostGameBloc(quizRepository, timeSyncRepository),
      seed:
          () => const HostGameState.loaded(
            quizId: quizId,
            status: QuizStatus.inProgress,
            gameState: GameState(
              currentQuestionIndex: 0,
              questionStartedAt: 1000,
            ),
            questions: [
              Question(text: 'Q1', options: ['A'], correctIndex: 0),
              Question(text: 'Q2', options: ['B'], correctIndex: 0),
            ],
            participants: [],
            questionDurationSeconds: 15,
          ),
      act: (bloc) {
        when(
          () => quizRepository.setCurrentQuestionIndex(
            quizId: quizId,
            currentQuestionIndex: 1,
            questionStartedAt: any(named: 'questionStartedAt'),
          ),
        ).thenAnswer((_) async => {});
        return bloc.add(const HostNextQuestionRequested());
      },
      verify: (_) {
        verify(
          () => quizRepository.setCurrentQuestionIndex(
            quizId: quizId,
            currentQuestionIndex: 1,
            questionStartedAt: any(named: 'questionStartedAt'),
          ),
        ).called(1);
      },
    );

    blocTest<HostGameBloc, HostGameState>(
      'HostNextQuestionRequested finishes game when no more questions',
      build: () => HostGameBloc(quizRepository, timeSyncRepository),
      seed:
          () => const HostGameState.loaded(
            quizId: quizId,
            status: QuizStatus.inProgress,
            gameState: GameState(
              currentQuestionIndex: 0,
              questionStartedAt: 1000,
            ),
            questions: [
              Question(text: 'Q1', options: ['A'], correctIndex: 0),
            ],
            participants: [],
            questionDurationSeconds: 15,
          ),
      act: (bloc) {
        when(
          () => quizRepository.finishGame(quizId: quizId),
        ).thenAnswer((_) async => {});
        return bloc.add(const HostNextQuestionRequested());
      },
      verify: (_) {
        verify(() => quizRepository.finishGame(quizId: quizId)).called(1);
      },
    );
  });
}
