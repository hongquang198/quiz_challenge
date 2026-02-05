// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameStateDto _$GameStateDtoFromJson(Map<String, dynamic> json) =>
    _GameStateDto(
      currentQuestionIndex:
          (json['currentQuestionIndex'] as num?)?.toInt() ?? -1,
      questionStartedAt: (json['questionStartedAt'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$GameStateDtoToJson(_GameStateDto instance) =>
    <String, dynamic>{
      'currentQuestionIndex': instance.currentQuestionIndex,
      'questionStartedAt': instance.questionStartedAt,
    };
