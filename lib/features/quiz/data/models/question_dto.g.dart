// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => _QuestionDto(
  text: json['text'] as String,
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  correctIndex: (json['correctIndex'] as num).toInt(),
);

Map<String, dynamic> _$QuestionDtoToJson(_QuestionDto instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': instance.options,
      'correctIndex': instance.correctIndex,
    };
