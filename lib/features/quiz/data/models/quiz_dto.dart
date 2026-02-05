import 'package:freezed_annotation/freezed_annotation.dart';

import 'game_state_dto.dart';
import 'question_dto.dart';
import 'quiz_config_dto.dart';

part 'quiz_dto.freezed.dart';
part 'quiz_dto.g.dart';

@freezed
abstract class QuizDto with _$QuizDto {
  const factory QuizDto({
    required QuizConfigDto config,
    required GameStateDto gameState,
    @Default(<String, QuestionDto>{}) Map<String, QuestionDto> questions,
  }) = _QuizDto;

  factory QuizDto.fromJson(Map<String, dynamic> json) => _$QuizDtoFromJson(json);
}

