import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String text,
    required List<String> options,
    required int correctIndex,
  }) = _Question;
}

