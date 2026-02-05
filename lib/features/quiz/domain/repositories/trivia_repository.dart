import '../entities/question.dart';

abstract interface class TriviaRepository {
  /// Fetches multiple-choice questions (Open Trivia DB in data layer).
  Future<List<Question>> fetchMultipleChoiceQuestions({required int amount});
}

