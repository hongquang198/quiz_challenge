import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer.freezed.dart';

@freezed
abstract class QuizAnswer with _$QuizAnswer {
  const factory QuizAnswer({
    required int questionIndex,
    required int selectedOptionIndex,

    /// Epoch millis of the client when answer was locked in (used for scoring).
    required int answeredAt,
  }) = _QuizAnswer;
}

