import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/repositories/auth_repository.dart';
import '../../../../core/domain/services/quiz_id_generator.dart';
import '../../domain/entities/answer_submission.dart';
import '../../domain/entities/game_state.dart';
import '../../domain/entities/participant.dart';
import '../../domain/entities/quiz.dart';
import '../../domain/entities/quiz_answer.dart';
import '../../domain/entities/quiz_config.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../../domain/repositories/trivia_repository.dart';
import '../datasources/rtdb_refs.dart';
import '../mappers/quiz_mappers.dart';
import '../models/participant_dto.dart';
import '../models/game_state_dto.dart';
import '../models/question_dto.dart';
import '../models/quiz_config_dto.dart';
import '../models/quiz_answer_dto.dart';
import '../models/quiz_dto.dart';

@LazySingleton(as: QuizRepository)
class FirebaseQuizRepository implements QuizRepository {
  FirebaseQuizRepository(
    FirebaseDatabase db,
    this._authRepository,
    this._quizIdGenerator,
    this._triviaRepository,
  ) : _refs = RtdbRefs(db);

  final AuthRepository _authRepository;
  final QuizIdGenerator _quizIdGenerator;
  final TriviaRepository _triviaRepository;
  final RtdbRefs _refs;

  @override
  Future<String> createQuiz({
    required String hostId,
    required int questionCount,
    required int questionDurationSeconds,
  }) async {
    for (var attempt = 0; attempt < 20; attempt++) {
      final quizId = _quizIdGenerator.generate();
      final exists = (await _refs.quizConfig(quizId).get()).exists;
      if (exists) continue;

      final questions = await _triviaRepository.fetchMultipleChoiceQuestions(
        amount: questionCount,
      );
      final quiz = Quiz(
        quizId: quizId,
        config: QuizConfig(
          hostId: hostId,
          status: QuizStatus.waiting,
          questionDuration: questionDurationSeconds,
        ),
        gameState: const GameState(
          currentQuestionIndex: -1,
          questionStartedAt: 0,
        ),
        questions: questions,
      );

      final dto = quiz.toDto();
      await _refs.quiz(quizId).set({
        'config': dto.config.toJson(),
        'gameState': dto.gameState.toJson(),
        'questions': dto.questions.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
      });
      return quizId;
    }

    throw const AppFailure.conflict(
      'Unable to generate unique quizId after retries.',
    );
  }

  @override
  @override
  Future<void> joinQuiz({
    required String quizId,
    required String userId,
    required String displayName,
  }) async {
    final configSnap = await _refs.quizConfig(quizId).get();
    if (!configSnap.exists) throw const AppFailure.notFound('Quiz not found.');

    final config = configSnap.value;
    if (config is! Map)
      throw const AppFailure.unknown('Quiz config is invalid.');

    // Check if user is already a participant
    final participantSnap = await _refs.participant(quizId, userId).get();
    final isAlreadyParticipant = participantSnap.exists;

    final status = (config['status'] as Object?)?.toString();

    // Only enforce "waiting" status for NEW participants
    if (!isAlreadyParticipant && status != 'waiting') {
      throw const AppFailure.validation('Quiz is not joinable.');
    }

    // Update/Set participant data (allows updating name on re-join)
    // Preserve existing score if re-joining
    final currentScore =
        isAlreadyParticipant
            ? ((participantSnap.value as Map?)?['score'] as int? ?? 0)
            : 0;

    final dto = ParticipantDto(name: displayName, score: currentScore);
    await _refs.participant(quizId, userId).set(dto.toJson());
  }

  @override
  Stream<Quiz> watchQuiz({required String quizId}) {
    return _refs.quiz(quizId).onValue.map((event) {
      final value = event.snapshot.value;
      print(
        'REPO: WatchQuiz Update for $quizId. Value: ${value != null}',
      ); // Debug
      if (value is! Map) {
        throw const AppFailure.notFound('Quiz not found.');
      }
      final raw = Map<Object?, Object?>.from(value);
      final configRaw = Map<String, dynamic>.from(
        (raw['config'] as Map?) ?? <String, dynamic>{},
      );
      final gameStateRaw = Map<String, dynamic>.from(
        (raw['gameState'] as Map?) ?? <String, dynamic>{},
      );
      // Firebase can return questions as either List or Map depending on structure
      final questionsRaw =
          raw['questions'] is List
              ? (raw['questions'] as List).asMap()
              : (raw['questions'] as Map?) ?? <Object?, Object?>{};

      final configDto = QuizConfigDto.fromJson(configRaw);
      final gameStateDto = GameStateDto.fromJson(gameStateRaw);

      final questionsDto = <String, QuestionDto>{};
      for (final entry in questionsRaw.entries) {
        final key = entry.key.toString();
        final qRaw = entry.value;
        if (qRaw is! Map) continue;
        final qJson = Map<String, dynamic>.from(qRaw);
        questionsDto[key] = QuestionDto.fromJson(qJson);
      }

      final dto = QuizDto(
        config: configDto,
        gameState: gameStateDto,
        questions: questionsDto,
      );
      return dto.toDomain(quizId);
    });
  }

  @override
  Stream<List<Participant>> watchParticipants({required String quizId}) {
    return _refs.participants(quizId).onValue.map((event) {
      final value = event.snapshot.value;
      if (value == null) return <Participant>[];
      if (value is! Map) return <Participant>[];

      final participants = <Participant>[];
      for (final entry in value.entries) {
        final userId = entry.key.toString();
        final raw = entry.value;
        if (raw is! Map) continue;
        final json = Map<String, dynamic>.from(raw);
        final dto = ParticipantDto.fromJson(json);
        participants.add(dto.toDomain(userId));
      }

      participants.sort((a, b) => b.score.compareTo(a.score));
      return participants;
    });
  }

  @override
  Future<void> startGame({required String quizId}) async {
    await _assertHost(quizId);
    final serverNow = await _estimateServerNowMillis();

    // Update individual fields (now allowed by security rules)
    await _refs.quizConfig(quizId).child('status').set('inProgress');
    await _refs.quizGameState(quizId).child('currentQuestionIndex').set(0);
    await _refs.quizGameState(quizId).child('questionStartedAt').set(serverNow);
  }

  @override
  Future<void> setCurrentQuestionIndex({
    required String quizId,
    required int currentQuestionIndex,
    required int questionStartedAt,
  }) async {
    await _assertHost(quizId);
    await _refs.quizGameState(quizId).update({
      'currentQuestionIndex': currentQuestionIndex,
      'questionStartedAt': questionStartedAt,
    });
  }

  @override
  Future<void> submitAnswer({
    required String quizId,
    required String userId,
    required QuizAnswer answer,
  }) async {
    final ref = _refs.answer(quizId, answer.questionIndex, userId);
    final dto = answer.toDto();

    final result = await ref.runTransaction((current) {
      if (current != null) {
        return Transaction.abort();
      }
      return Transaction.success(dto.toJson());
    });

    if (!result.committed) {
      throw const AppFailure.conflict('Answer already submitted.');
    }
  }

  @override
  Stream<AnswerSubmission> watchAnswerSubmissionsForQuestion({
    required String quizId,
    required int questionIndex,
  }) {
    return _refs.answersForQuestion(quizId, questionIndex).onChildAdded.map((
      event,
    ) {
      final userId = event.snapshot.key;
      final value = event.snapshot.value;
      if (userId == null || value is! Map) {
        throw const AppFailure.unknown('Invalid answer submission shape.');
      }
      final json = Map<String, dynamic>.from(value);
      final dto = QuizAnswerDto.fromJson(json);
      return answerSubmissionFromDto(userId: userId, dto: dto);
    });
  }

  @override
  Future<bool> awardPointsOnce({
    required String quizId,
    required int questionIndex,
    required String userId,
    required int points,
  }) async {
    await _assertHost(quizId);

    final guardRef = _refs.pointsAwarded(quizId, questionIndex, userId);
    final guardResult = await guardRef.runTransaction((current) {
      if (current != null) return Transaction.abort();
      return Transaction.success(points);
    });

    if (!guardResult.committed) return false;

    // Now increment score (separate write, but guarded by the idempotency node above).
    final scoreRef = _refs.participant(quizId, userId).child('score');
    await scoreRef.runTransaction((current) {
      final currentScore = (current is num) ? current.toInt() : 0;
      return Transaction.success(currentScore + points);
    });

    return true;
  }

  @override
  Future<void> finishGame({required String quizId}) async {
    await _assertHost(quizId);
    await _refs.quizConfig(quizId).child('status').set('finished');
  }

  Future<void> _assertHost(String quizId) async {
    final currentUserId = _authRepository.currentUserId();
    if (currentUserId == null)
      throw const AppFailure.permissionDenied('Not signed in.');

    final hostSnap = await _refs.quizConfig(quizId).child('hostId').get();
    if (!hostSnap.exists) throw const AppFailure.notFound('Quiz not found.');
    final hostId = hostSnap.value?.toString();
    if (hostId != currentUserId) {
      throw const AppFailure.permissionDenied(
        'Only host may perform this action.',
      );
    }
  }

  Future<int> _estimateServerNowMillis() async {
    try {
      final offsetSnap = await _refs.serverTimeOffset().get();
      final offsetVal = offsetSnap.value;
      final offset = switch (offsetVal) {
        int v => v,
        num v => v.toInt(),
        _ => 0,
      };
      return DateTime.now().millisecondsSinceEpoch + offset;
    } catch (e) {
      print('Warning: Failed to get server time offset: $e');
      return DateTime.now().millisecondsSinceEpoch;
    }
  }
}
