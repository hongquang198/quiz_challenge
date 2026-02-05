import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state_dto.freezed.dart';
part 'game_state_dto.g.dart';

@freezed
abstract class GameStateDto with _$GameStateDto {
  const factory GameStateDto({
    @Default(-1) int currentQuestionIndex,
    @Default(0) int questionStartedAt,
  }) = _GameStateDto;

  factory GameStateDto.fromJson(Map<String, dynamic> json) => _$GameStateDtoFromJson(json);
}

