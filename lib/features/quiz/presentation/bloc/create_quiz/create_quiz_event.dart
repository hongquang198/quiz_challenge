part of 'create_quiz_bloc.dart';

@freezed
sealed class CreateQuizEvent with _$CreateQuizEvent {
  const factory CreateQuizEvent.createQuizRequested({
    required int questionCount,
    required int questionDurationSeconds,
  }) = CreateQuizRequested;
}

