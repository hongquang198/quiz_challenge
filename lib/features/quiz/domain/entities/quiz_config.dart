import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_config.freezed.dart';

enum QuizStatus { waiting, inProgress, finished }

@freezed
abstract class QuizConfig with _$QuizConfig {
  const factory QuizConfig({
    required String hostId,
    required QuizStatus status,
    @Default(15) int questionDuration,
  }) = _QuizConfig;
}

