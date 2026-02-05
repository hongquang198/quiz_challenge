// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParticipantDto _$ParticipantDtoFromJson(Map<String, dynamic> json) =>
    _ParticipantDto(
      name: json['name'] as String,
      score: (json['score'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ParticipantDtoToJson(_ParticipantDto instance) =>
    <String, dynamic>{'name': instance.name, 'score': instance.score};
