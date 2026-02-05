import 'package:meta/meta.dart';

import '../entities/answer_submission.dart';
import '../entities/participant.dart';
import '../entities/quiz.dart';
import '../entities/quiz_answer.dart';

@immutable
abstract interface class QuizRepository {
  /// Creates a new quiz under `/quizzes/{quizId}` and returns the `quizId`.
  ///
  /// Uniqueness of `quizId` is enforced by the data layer via an O(1) probe
  /// before finalizing (per REQS).
  Future<String> createQuiz({
    required String hostId,
    required int questionCount,
    required int questionDurationSeconds,
  });

  /// Host transitions:
  /// - config.status -> inProgress
  /// - gameState.currentQuestionIndex -> 0
  /// - gameState.questionStartedAt -> server synced millis
  Future<void> startGame({required String quizId});

  /// Host advances to the next question (clients follow via streams).
  Future<void> setCurrentQuestionIndex({
    required String quizId,
    required int currentQuestionIndex,
    required int questionStartedAt,
  });

  /// Player joins a quiz (only allowed when status == waiting).
  Future<void> joinQuiz({
    required String quizId,
    required String userId,
    required String displayName,
  });

  /// Live quiz updates (status, current question index, questions, etc).
  Stream<Quiz> watchQuiz({required String quizId});

  /// Lobby + leaderboard updates.
  Stream<List<Participant>> watchParticipants({required String quizId});

  /// Write-once answer submission for a user for the given question.
  ///
  /// Host-authoritative scoring: this does NOT update scores.
  Future<void> submitAnswer({
    required String quizId,
    required String userId,
    required QuizAnswer answer,
  });

  /// Host-only: stream answer submissions for a question (used for scoring).
  Stream<AnswerSubmission> watchAnswerSubmissionsForQuestion({
    required String quizId,
    required int questionIndex,
  });

  /// Host-only + idempotent: award points for a user's answer for a question.
  ///
  /// Returns `true` if points were awarded (first time), `false` if this award
  /// was already processed.
  Future<bool> awardPointsOnce({
    required String quizId,
    required int questionIndex,
    required String userId,
    required int points,
  });

  Future<void> finishGame({required String quizId});
}

