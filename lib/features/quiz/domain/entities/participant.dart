import 'package:freezed_annotation/freezed_annotation.dart';

part 'participant.freezed.dart';

@freezed
abstract class Participant with _$Participant {
  const factory Participant({
    required String userId,
    required String name,
    @Default(0) int score,
  }) = _Participant;
}

