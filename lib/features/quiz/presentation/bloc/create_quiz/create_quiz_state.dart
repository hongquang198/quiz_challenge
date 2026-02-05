part of 'create_quiz_bloc.dart';

@freezed
class CreateQuizState with _$CreateQuizState {
  const factory CreateQuizState.initial() = _Initial;

  const factory CreateQuizState.loading() = _Loading;

  const factory CreateQuizState.success({
    required String quizId,
  }) = _Success;

  const factory CreateQuizState.failure({
    required String message,
  }) = _Failure;
}

