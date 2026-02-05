import 'package:freezed_annotation/freezed_annotation.dart';

import 'game_state.dart';
import 'question.dart';
import 'quiz_config.dart';

part 'quiz.freezed.dart';

@freezed
abstract class Quiz with _$Quiz {
  const factory Quiz({
    required String quizId,
    required QuizConfig config,
    required GameState gameState,
    @Default(<Question>[]) List<Question> questions,
  }) = _Quiz;
}

