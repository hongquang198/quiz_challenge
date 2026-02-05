import 'package:freezed_annotation/freezed_annotation.dart';

import 'quiz_answer.dart';

part 'answer_submission.freezed.dart';

@freezed
abstract class AnswerSubmission with _$AnswerSubmission {
  const factory AnswerSubmission({
    required String userId,
    required QuizAnswer answer,
  }) = _AnswerSubmission;
}

