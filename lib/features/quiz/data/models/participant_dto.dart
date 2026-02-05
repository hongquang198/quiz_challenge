import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant_dto.freezed.dart';
part 'participant_dto.g.dart';

@freezed
abstract class ParticipantDto with _$ParticipantDto {
  const factory ParticipantDto({
    required String name,
    @Default(0) int score,
  }) = _ParticipantDto;

  factory ParticipantDto.fromJson(Map<String, dynamic> json) => _$ParticipantDtoFromJson(json);
}

