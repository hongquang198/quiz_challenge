import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_answer_dto.freezed.dart';
part 'quiz_answer_dto.g.dart';

@freezed
abstract class QuizAnswerDto with _$QuizAnswerDto {
  const factory QuizAnswerDto({
    required int questionIndex,
    required int selectedOptionIndex,
    required int answeredAt,
  }) = _QuizAnswerDto;

  factory QuizAnswerDto.fromJson(Map<String, dynamic> json) => _$QuizAnswerDtoFromJson(json);
}

