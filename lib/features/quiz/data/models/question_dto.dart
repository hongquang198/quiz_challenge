import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_dto.freezed.dart';
part 'question_dto.g.dart';

@freezed
abstract class QuestionDto with _$QuestionDto {
  const factory QuestionDto({
    required String text,
    required List<String> options,
    required int correctIndex,
  }) = _QuestionDto;

  factory QuestionDto.fromJson(Map<String, dynamic> json) => _$QuestionDtoFromJson(json);
}

