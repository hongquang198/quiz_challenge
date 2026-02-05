import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../models/question_dto.dart';

@lazySingleton
class OpenTriviaApi {
  OpenTriviaApi();

  final http.Client _client = http.Client();
  final HtmlUnescape _unescape = HtmlUnescape();

  Future<List<QuestionDto>> fetchMultipleChoiceQuestions({
    required int amount,
  }) async {
    final uri = Uri.https('opentdb.com', '/api.php', {
      'amount': '$amount',
      'type': 'multiple',
    });

    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw StateError('OpenTrivia API failed: ${response.statusCode}');
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw StateError('OpenTrivia API returned non-object JSON.');
    }

    final results = decoded['results'];
    if (results is! List) {
      throw StateError('OpenTrivia API JSON missing results.');
    }

    final questions = <QuestionDto>[];
    for (final item in results) {
      if (item is! Map) continue;
      final question = item['question'];
      final correct = item['correct_answer'];
      final incorrect = item['incorrect_answers'];
      if (question is! String || correct is! String || incorrect is! List) {
        continue;
      }

      final unescapedCorrect = _unescape.convert(correct);
      final options =
          <String>[
            ...incorrect.whereType<String>(),
            correct,
          ].map(_unescape.convert).toList();

      // Implement shuffling to ensure correct answer isn't always last.
      options.shuffle();

      final correctIndex = options.indexOf(unescapedCorrect);

      questions.add(
        QuestionDto(
          text: _unescape.convert(question),
          options: options,
          correctIndex: correctIndex,
        ),
      );
    }

    return questions;
  }
}
