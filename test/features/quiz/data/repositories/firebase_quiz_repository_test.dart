import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_time_quiz/core/domain/failures/app_failure.dart';
import 'package:real_time_quiz/core/domain/repositories/auth_repository.dart';
import 'package:real_time_quiz/core/domain/services/quiz_id_generator.dart';
import 'package:real_time_quiz/features/quiz/data/repositories/firebase_quiz_repository.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/question.dart';
import 'package:real_time_quiz/features/quiz/domain/entities/quiz_answer.dart';
import 'package:real_time_quiz/features/quiz/domain/repositories/trivia_repository.dart';

class _MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class _MockDatabaseReference extends Mock implements DatabaseReference {}

class _MockDataSnapshot extends Mock implements DataSnapshot {}

class _MockDatabaseEvent extends Mock implements DatabaseEvent {}

class _MockAuthRepository extends Mock implements AuthRepository {}

class _MockQuizIdGenerator extends Mock implements QuizIdGenerator {}

class _MockTriviaRepository extends Mock implements TriviaRepository {}

class MockTransactionResult extends Mock implements TransactionResult {}

void main() {
  group('FirebaseQuizRepository', () {
    late _MockFirebaseDatabase db;
    late _MockDatabaseReference rootRef;
    late _MockAuthRepository authRepository;
    late _MockQuizIdGenerator quizIdGenerator;
    late _MockTriviaRepository triviaRepository;
    late FirebaseQuizRepository repository;

    setUp(() {
      db = _MockFirebaseDatabase();
      rootRef = _MockDatabaseReference();
      authRepository = _MockAuthRepository();
      quizIdGenerator = _MockQuizIdGenerator();
      triviaRepository = _MockTriviaRepository();

      when(() => db.ref(any())).thenReturn(rootRef);
      when(() => rootRef.child(any())).thenReturn(rootRef);

      repository = FirebaseQuizRepository(
        db,
        authRepository,
        quizIdGenerator,
        triviaRepository,
      );
    });

    test('createQuiz succeeds after retries', () async {
      const quizId = 'ABC123';
      const hostId = 'host1';

      when(() => quizIdGenerator.generate()).thenReturn(quizId);

      final configRef = _MockDatabaseReference();
      final quizRef = _MockDatabaseReference();
      final snapshot = _MockDataSnapshot();

      when(() => db.ref('quizzes/$quizId/config')).thenReturn(configRef);
      when(() => db.ref('quizzes/$quizId')).thenReturn(quizRef);
      when(() => configRef.get()).thenAnswer((_) async => snapshot);
      when(() => snapshot.exists).thenReturn(false);

      when(
        () => triviaRepository.fetchMultipleChoiceQuestions(amount: 5),
      ).thenAnswer(
        (_) async => const [
          Question(text: 'Q1', options: ['A'], correctIndex: 0),
        ],
      );

      when(() => quizRef.set(any())).thenAnswer((_) async {});

      final result = await repository.createQuiz(
        hostId: hostId,
        questionCount: 5,
        questionDurationSeconds: 15,
      );

      expect(result, quizId);
      verify(() => quizRef.set(any())).called(1);
    });

    test('finishGame assertive host check fails if not host', () async {
      const quizId = 'ABC123';
      when(
        () => authRepository.currentUserId(),
      ).thenReturn('user2'); // Not host

      final configRef = _MockDatabaseReference();
      final hostIdRef = _MockDatabaseReference();
      final snapshot = _MockDataSnapshot();

      when(() => db.ref('quizzes/$quizId/config')).thenReturn(configRef);
      when(() => configRef.child('hostId')).thenReturn(hostIdRef);
      when(() => hostIdRef.get()).thenAnswer((_) async => snapshot);
      when(() => snapshot.exists).thenReturn(true);
      when(() => snapshot.value).thenReturn('host1'); // Real host

      expect(
        () => repository.finishGame(quizId: quizId),
        throwsA(isA<AppFailure>()),
      );
    });

    test('joinQuiz succeeds for existing quiz', () async {
      const quizId = 'ABC123';
      const userId = 'user1';
      const displayName = 'Player 1';

      final configRef = _MockDatabaseReference();
      final participantRef = _MockDatabaseReference();
      final configSnap = _MockDataSnapshot();
      final participantSnap = _MockDataSnapshot();

      when(() => db.ref('quizzes/$quizId/config')).thenReturn(configRef);
      when(
        () => db.ref('participants/$quizId/$userId'),
      ).thenReturn(participantRef);

      when(() => configRef.get()).thenAnswer((_) async => configSnap);
      when(() => configSnap.exists).thenReturn(true);
      when(() => configSnap.value).thenReturn({'status': 'waiting'});

      when(() => participantRef.get()).thenAnswer((_) async => participantSnap);
      when(() => participantSnap.exists).thenReturn(false);

      when(() => participantRef.set(any())).thenAnswer((_) async {});

      await repository.joinQuiz(
        quizId: quizId,
        userId: userId,
        displayName: displayName,
      );

      verify(() => participantRef.set(any())).called(1);
    });

    test('watchQuiz parses stream updates correctly', () async {
      const quizId = 'ABC123';
      final quizRef = _MockDatabaseReference();
      final event = _MockDatabaseEvent();
      final snapshot = _MockDataSnapshot();

      when(() => db.ref('quizzes/$quizId')).thenReturn(quizRef);
      when(() => quizRef.onValue).thenAnswer((_) => Stream.value(event));
      when(() => event.snapshot).thenReturn(snapshot);

      final rawData = {
        'config': {'hostId': 'h1', 'status': 'waiting', 'questionDuration': 15},
        'gameState': {'currentQuestionIndex': -1, 'questionStartedAt': 0},
        'questions': {
          '0': {
            'text': 'Q1',
            'options': ['A'],
            'correctIndex': 0,
          },
        },
      };

      when(() => snapshot.value).thenReturn(rawData);

      final result = await repository.watchQuiz(quizId: quizId).first;

      expect(result.quizId, quizId);
      expect(result.config.hostId, 'h1');
      expect(result.questions.length, 1);
    });

    test('submitAnswer uses transaction and handles success', () async {
      const quizId = 'ABC123';
      const userId = 'u1';
      const answer = QuizAnswer(
        questionIndex: 0,
        selectedOptionIndex: 1,
        answeredAt: 100,
      );

      final answerRef = _MockDatabaseReference();
      final transactionResult = MockTransactionResult();

      when(() => db.ref('answers/$quizId/0/u1')).thenReturn(answerRef);
      when(() => answerRef.runTransaction(any())).thenAnswer((
        invocation,
      ) async {
        final handler = invocation.positionalArguments[0] as TransactionHandler;
        handler(null); // Success
        return transactionResult;
      });
      when(() => transactionResult.committed).thenReturn(true);

      await repository.submitAnswer(
        quizId: quizId,
        userId: userId,
        answer: answer,
      );

      verify(() => answerRef.runTransaction(any())).called(1);
    });

    test(
      'awardPointsOnce correctly increments score using transactions',
      () async {
        const quizId = 'ABC123';
        const userId = 'u1';
        const questionIndex = 0;
        const points = 100;

        // Mock Host Auth Check
        when(() => authRepository.currentUserId()).thenReturn('host1');
        final hostIdRef = _MockDatabaseReference();
        final configRef = _MockDatabaseReference();
        final hostSnap = _MockDataSnapshot();
        when(() => db.ref('quizzes/$quizId/config')).thenReturn(configRef);
        when(() => configRef.child('hostId')).thenReturn(hostIdRef);
        when(() => hostIdRef.get()).thenAnswer((_) async => hostSnap);
        when(() => hostSnap.exists).thenReturn(true);
        when(() => hostSnap.value).thenReturn('host1');

        final guardRef = _MockDatabaseReference();
        final scoreRef = _MockDatabaseReference();
        final guardRes = MockTransactionResult();
        final scoreRes = MockTransactionResult();

        when(() => db.ref('pointsAwarded/ABC123/0/u1')).thenReturn(guardRef);
        when(() => db.ref('participants/ABC123/u1')).thenReturn(rootRef);
        when(() => rootRef.child('score')).thenReturn(scoreRef);

        when(() => guardRef.runTransaction(any())).thenAnswer((inv) async {
          final handler = inv.positionalArguments[0] as TransactionHandler;
          handler(null);
          return guardRes;
        });
        when(() => guardRes.committed).thenReturn(true);

        when(() => scoreRef.runTransaction(any())).thenAnswer((inv) async {
          final handler = inv.positionalArguments[0] as TransactionHandler;
          handler(50);
          return scoreRes;
        });
        when(() => scoreRes.committed).thenReturn(true);

        final result = await repository.awardPointsOnce(
          quizId: quizId,
          questionIndex: questionIndex,
          userId: userId,
          points: points,
        );

        expect(result, isTrue);
        verify(() => guardRef.runTransaction(any())).called(1);
        verify(() => scoreRef.runTransaction(any())).called(1);
      },
    );

    test(
      'startGame sets status to inProgress and initializes first question',
      () async {
        const quizId = 'ABC123';
        when(() => authRepository.currentUserId()).thenReturn('host1');

        final hostIdRef = _MockDatabaseReference();
        final configRef = _MockDatabaseReference();
        final hostSnap = _MockDataSnapshot();
        when(() => db.ref('quizzes/$quizId/config')).thenReturn(configRef);
        when(() => configRef.child('hostId')).thenReturn(hostIdRef);
        when(() => hostIdRef.get()).thenAnswer((_) async => hostSnap);
        when(() => hostSnap.exists).thenReturn(true);
        when(() => hostSnap.value).thenReturn('host1');

        final statusRef = _MockDatabaseReference();
        final gameStateRef = _MockDatabaseReference();
        final questionIndexRef = _MockDatabaseReference();
        final questionStartRef = _MockDatabaseReference();

        when(() => configRef.child('status')).thenReturn(statusRef);
        when(
          () => db.ref('quizzes/$quizId/gameState'),
        ).thenReturn(gameStateRef);
        when(
          () => gameStateRef.child('currentQuestionIndex'),
        ).thenReturn(questionIndexRef);
        when(
          () => gameStateRef.child('questionStartedAt'),
        ).thenReturn(questionStartRef);

        when(() => statusRef.set(any())).thenAnswer((_) async {});
        when(() => questionIndexRef.set(any())).thenAnswer((_) async {});
        when(() => questionStartRef.set(any())).thenAnswer((_) async {});

        final offsetRef = _MockDatabaseReference();
        final offsetSnap = _MockDataSnapshot();
        when(() => db.ref('.info/serverTimeOffset')).thenReturn(offsetRef);
        when(() => offsetRef.get()).thenAnswer((_) async => offsetSnap);
        when(() => offsetSnap.value).thenReturn(0);

        await repository.startGame(quizId: quizId);

        verify(() => statusRef.set('inProgress')).called(1);
        verify(() => questionIndexRef.set(0)).called(1);
      },
    );

    test('watchParticipants parses map and sorts by score', () async {
      const quizId = 'ABC123';
      final participantsRef = _MockDatabaseReference();
      final event = _MockDatabaseEvent();
      final snapshot = _MockDataSnapshot();

      when(() => db.ref('participants/$quizId')).thenReturn(participantsRef);
      when(
        () => participantsRef.onValue,
      ).thenAnswer((_) => Stream.value(event));
      when(() => event.snapshot).thenReturn(snapshot);

      final rawData = {
        'u1': {'name': 'Alice', 'score': 10},
        'u2': {'name': 'Bob', 'score': 50},
      };

      when(() => snapshot.value).thenReturn(rawData);

      final result = await repository.watchParticipants(quizId: quizId).first;

      expect(result.length, 2);
      expect(result[0].name, 'Bob');
      expect(result[1].name, 'Alice');
    });
  });
}
