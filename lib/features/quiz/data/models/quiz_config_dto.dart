import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_config_dto.freezed.dart';
part 'quiz_config_dto.g.dart';

@freezed
abstract class QuizConfigDto with _$QuizConfigDto {
  const factory QuizConfigDto({
    required String hostId,
    required String status,
    @Default(15) int questionDuration,
  }) = _QuizConfigDto;

  factory QuizConfigDto.fromJson(Map<String, dynamic> json) => _$QuizConfigDtoFromJson(json);
}

