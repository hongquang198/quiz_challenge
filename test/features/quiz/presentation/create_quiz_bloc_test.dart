import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:real_time_quiz/features/quiz/presentation/bloc/create_quiz/create_quiz_bloc.dart';
import 'package:real_time_quiz/core/domain/repositories/auth_repository.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/quiz_repository.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

class _MockQuizRepository extends Mock implements QuizRepository {}

void main() {
  group('CreateQuizBloc', () {
    late _MockAuthRepository authRepository;
    late _MockQuizRepository quizRepository;

    setUp(() {
      authRepository = _MockAuthRepository();
      quizRepository = _MockQuizRepository();

      when(() => authRepository.currentUserId()).thenReturn('host1');
      when(
        () => authRepository.signInAnonymously(),
      ).thenAnswer((_) async => 'host1');
    });

    blocTest<CreateQuizBloc, CreateQuizState>(
      'emits success with quizId when creation succeeds',
      build: () {
        when(
          () => quizRepository.createQuiz(
            hostId: any(named: 'hostId'),
            questionCount: any(named: 'questionCount'),
            questionDurationSeconds: any(named: 'questionDurationSeconds'),
          ),
        ).thenAnswer((_) async => 'ABC123');

        return CreateQuizBloc(authRepository, quizRepository);
      },
      act:
          (bloc) => bloc.add(
            const CreateQuizRequested(
              questionCount: 10,
              questionDurationSeconds: 15,
            ),
          ),
      expect:
          () => const [
            CreateQuizState.loading(),
            CreateQuizState.success(quizId: 'ABC123'),
          ],
      verify: (bloc) {
        verify(
          () => quizRepository.createQuiz(
            hostId: 'host1',
            questionCount: 10,
            questionDurationSeconds: 15,
          ),
        ).called(1);
      },
    );

    blocTest<CreateQuizBloc, CreateQuizState>(
      'emits failure when creation fails',
      build: () {
        when(
          () => quizRepository.createQuiz(
            hostId: any(named: 'hostId'),
            questionCount: any(named: 'questionCount'),
            questionDurationSeconds: any(named: 'questionDurationSeconds'),
          ),
        ).thenThrow(Exception('Failed to create quiz'));

        return CreateQuizBloc(authRepository, quizRepository);
      },
      act:
          (bloc) => bloc.add(
            const CreateQuizRequested(
              questionCount: 10,
              questionDurationSeconds: 15,
            ),
          ),
      expect:
          () => const [
            CreateQuizState.loading(),
            CreateQuizState.failure(
              message: 'Exception: Failed to create quiz',
            ),
          ],
    );
  });
}
