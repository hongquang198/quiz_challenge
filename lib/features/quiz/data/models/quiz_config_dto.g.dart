// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_config_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QuizConfigDto _$QuizConfigDtoFromJson(Map<String, dynamic> json) =>
    _QuizConfigDto(
      hostId: json['hostId'] as String,
      status: json['status'] as String,
      questionDuration: (json['questionDuration'] as num?)?.toInt() ?? 15,
    );

Map<String, dynamic> _$QuizConfigDtoToJson(_QuizConfigDto instance) =>
    <String, dynamic>{
      'hostId': instance.hostId,
      'status': instance.status,
      'questionDuration': instance.questionDuration,
    };
