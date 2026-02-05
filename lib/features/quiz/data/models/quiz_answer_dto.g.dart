// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_answer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizAnswerDto _$QuizAnswerDtoFromJson(Map<String, dynamic> json) =>
    _QuizAnswerDto(
      questionIndex: (json['questionIndex'] as num).toInt(),
      selectedOptionIndex: (json['selectedOptionIndex'] as num).toInt(),
      answeredAt: (json['answeredAt'] as num).toInt(),
    );

Map<String, dynamic> _$QuizAnswerDtoToJson(_QuizAnswerDto instance) =>
    <String, dynamic>{
      'questionIndex': instance.questionIndex,
      'selectedOptionIndex': instance.selectedOptionIndex,
      'answeredAt': instance.answeredAt,
    };
