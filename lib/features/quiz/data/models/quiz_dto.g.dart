// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizDto _$QuizDtoFromJson(Map<String, dynamic> json) => _QuizDto(
  config: QuizConfigDto.fromJson(json['config'] as Map<String, dynamic>),
  gameState: GameStateDto.fromJson(json['gameState'] as Map<String, dynamic>),
  questions:
      (json['questions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, QuestionDto.fromJson(e as Map<String, dynamic>)),
      ) ??
      const <String, QuestionDto>{},
);

Map<String, dynamic> _$QuizDtoToJson(_QuizDto instance) => <String, dynamic>{
  'config': instance.config,
  'gameState': instance.gameState,
  'questions': instance.questions,
};
