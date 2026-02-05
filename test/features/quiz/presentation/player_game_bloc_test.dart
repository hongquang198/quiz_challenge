import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:real_time_quiz/features/quiz/presentation/bloc/player_game/player_game_bloc.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/game_state.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/participant.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/question.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_config.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_answer.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/time_sync_repository.dart';
import 'package:real_time_quiz/core/domain/repositories/auth_repository.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

class _MockQuizRepository extends Mock implements QuizRepository {}

class _MockTimeSyncRepository extends Mock implements TimeSyncRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const QuizAnswer(questionIndex: 0, selectedOptionIndex: 0, answeredAt: 0),
    );
  });

  group('PlayerGameBloc', () {
    late _MockAuthRepository authRepository;
    late _MockQuizRepository quizRepository;
    late _MockTimeSyncRepository timeSyncRepository;

    setUp(() {
      authRepository = _MockAuthRepository();
      quizRepository = _MockQuizRepository();
      timeSyncRepository = _MockTimeSyncRepository();

      when(() => authRepository.currentUserId()).thenReturn('user1');
      when(
        () => authRepository.signInAnonymously(),
      ).thenAnswer((_) async => 'user1');

      when(
        () => quizRepository.submitAnswer(
          quizId: any(named: 'quizId'),
          userId: any(named: 'userId'),
          answer: any(named: 'answer'),
        ),
      ).thenAnswer((_) async {});

      when(
        () => timeSyncRepository.watchServerTimeOffsetMillis(),
      ).thenAnswer((_) => Stream.value(0));
    });

    blocTest<PlayerGameBloc, PlayerGameState>(
      'PlayerJoinRequested emits loading and then loaded on success',
      build: () {
        when(
          () => quizRepository.watchQuiz(quizId: any(named: 'quizId')),
        ).thenAnswer(
          (_) => Stream.value(
            const Quiz(
              quizId: 'ABC123',
              config: QuizConfig(hostId: 'h2', status: QuizStatus.waiting),
              gameState: GameState(
                currentQuestionIndex: -1,
                questionStartedAt: 0,
              ),
              questions: [],
            ),
          ),
        );
        when(
          () => quizRepository.watchParticipants(quizId: any(named: 'quizId')),
        ).thenAnswer((_) => Stream.value([]));
        when(
          () => quizRepository.joinQuiz(
            quizId: any(named: 'quizId'),
            userId: any(named: 'userId'),
            displayName: any(named: 'displayName'),
          ),
        ).thenAnswer((_) async {});

        return PlayerGameBloc(
          authRepository,
          quizRepository,
          timeSyncRepository,
        );
      },
      act:
          (bloc) => bloc.add(
            const PlayerJoinRequested(
              quizId: 'ABC123',
              displayName: 'Player 1',
            ),
          ),
      expect:
          () => [
            const PlayerGameState.loading(),
            isA<PlayerGameLoaded>().having((s) => s.quizId, 'quizId', 'ABC123'),
          ],
    );

    blocTest<PlayerGameBloc, PlayerGameState>(
      'PlayerJoinRequested emits redirectToHost when host joins as player',
      build: () {
        // Mock current user as host
        when(() => authRepository.currentUserId()).thenReturn('host1');

        when(
          () => quizRepository.watchQuiz(quizId: any(named: 'quizId')),
        ).thenAnswer(
          (_) => Stream.value(
            const Quiz(
              quizId: 'ABC123',
              config: QuizConfig(hostId: 'host1', status: QuizStatus.waiting),
              gameState: GameState(
                currentQuestionIndex: -1,
                questionStartedAt: 0,
              ),
              questions: [],
            ),
          ),
        );

        return PlayerGameBloc(
          authRepository,
          quizRepository,
          timeSyncRepository,
        );
      },
      act:
          (bloc) => bloc.add(
            const PlayerJoinRequested(
              quizId: 'ABC123',
              displayName: 'Host Name',
            ),
          ),
      expect:
          () => [
            const PlayerGameState.loading(),
            const PlayerGameState.redirectToHost(quizId: 'ABC123'),
          ],
    );

    blocTest<PlayerGameBloc, PlayerGameState>(
      'sets hasAnsweredCurrentQuestion when answer is selected',
      build:
          () => PlayerGameBloc(
            authRepository,
            quizRepository,
            timeSyncRepository,
          ),
      seed:
          () => PlayerGameLoaded(
            quizId: 'ABC123',
            selfId: 'user1',
            status: QuizStatus.inProgress,
            gameState: const GameState(
              currentQuestionIndex: 0,
              questionStartedAt: 1000,
            ),
            questions: const [
              Question(
                text: 'Q1',
                options: ['A', 'B', 'C', 'D'],
                correctIndex: 1,
              ),
            ],
            participants: const <Participant>[],
            questionDurationSeconds: 15,
            secondsRemaining: 15,
            hasAnsweredCurrentQuestion: false,
          ),
      act:
          (bloc) =>
              bloc.add(const PlayerAnswerSelected(selectedOptionIndex: 2)),
      expect:
          () => [
            isA<PlayerGameLoaded>().having(
              (s) => s.hasAnsweredCurrentQuestion,
              'hasAnsweredCurrentQuestion',
              true,
            ),
          ],
    );
  });
}
