import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/participant.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_config.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/game_state.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:real_time_quiz/features/quiz/presentation/bloc/lobby/lobby_bloc.dart';

class _MockQuizRepository extends Mock implements QuizRepository {}

void main() {
  group('LobbyBloc', () {
    late _MockQuizRepository quizRepository;
    const quizId = 'ABC123';

    setUp(() {
      quizRepository = _MockQuizRepository();
    });

    test('initial state is correct', () {
      expect(LobbyBloc(quizRepository).state, const LobbyState.initial());
    });

    blocTest<LobbyBloc, LobbyState>(
      'LobbyStarted emits loading and starts watching participants/quiz',
      build: () {
        when(
          () => quizRepository.watchParticipants(quizId: quizId),
        ).thenAnswer((_) => const Stream.empty());
        when(
          () => quizRepository.watchQuiz(quizId: quizId),
        ).thenAnswer((_) => const Stream.empty());
        return LobbyBloc(quizRepository);
      },
      act: (bloc) => bloc.add(const LobbyStarted(quizId: quizId)),
      expect: () => const [LobbyState.loading()],
      verify: (_) {
        verify(
          () => quizRepository.watchParticipants(quizId: quizId),
        ).called(1);
        verify(() => quizRepository.watchQuiz(quizId: quizId)).called(1);
      },
    );

    blocTest<LobbyBloc, LobbyState>(
      'emits loaded with participants when LobbyParticipantsUpdated is added',
      build: () => LobbyBloc(quizRepository),
      act:
          (bloc) => bloc.add(
            const LobbyParticipantsUpdated([
              Participant(userId: 'u1', name: 'User 1', score: 0),
            ]),
          ),
      expect:
          () => [
            isA<LobbyLoaded>().having(
              (s) => s.participants.length,
              'participants length',
              1,
            ),
          ],
    );

    blocTest<LobbyBloc, LobbyState>(
      'emits loaded with quiz when LobbyQuizUpdated is added',
      build: () => LobbyBloc(quizRepository),
      act:
          (bloc) => bloc.add(
            const LobbyQuizUpdated(
              Quiz(
                quizId: quizId,
                config: QuizConfig(
                  hostId: 'h1',
                  status: QuizStatus.waiting,
                  questionDuration: 15,
                ),
                questions: [],
                gameState: GameState(
                  currentQuestionIndex: -1,
                  questionStartedAt: 0,
                ),
              ),
            ),
          ),
      expect:
          () => [
            isA<LobbyLoaded>().having((s) => s.quiz?.quizId, 'quizId', quizId),
          ],
    );

    blocTest<LobbyBloc, LobbyState>(
      'preserves participants when LobbyQuizUpdated is added',
      build: () => LobbyBloc(quizRepository),
      seed:
          () => const LobbyState.loaded(
            participants: [
              Participant(userId: 'u1', name: 'User 1', score: 10),
            ],
          ),
      act:
          (bloc) => bloc.add(
            const LobbyQuizUpdated(
              Quiz(
                quizId: quizId,
                config: QuizConfig(
                  hostId: 'h1',
                  status: QuizStatus.waiting,
                  questionDuration: 15,
                ),
                questions: [],
                gameState: GameState(
                  currentQuestionIndex: -1,
                  questionStartedAt: 0,
                ),
              ),
            ),
          ),
      expect:
          () => [
            isA<LobbyLoaded>()
                .having((s) => s.participants.length, 'participants length', 1)
                .having((s) => s.quiz?.quizId, 'quizId', quizId),
          ],
    );
  });
}
