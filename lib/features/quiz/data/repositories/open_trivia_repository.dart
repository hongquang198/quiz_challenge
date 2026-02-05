import 'package:injectable/injectable.dart';

import '../../domain/entities/question.dart';
import '../../domain/repositories/trivia_repository.dart';
import '../datasources/open_trivia_api.dart';
import '../mappers/quiz_mappers.dart';

@LazySingleton(as: TriviaRepository)
class OpenTriviaRepository implements TriviaRepository {
  OpenTriviaRepository(this._api);

  final OpenTriviaApi _api;

  @override
  Future<List<Question>> fetchMultipleChoiceQuestions({required int amount}) async {
    final dtos = await _api.fetchMultipleChoiceQuestions(amount: amount);
    return dtos.map((q) => q.toDomain()).toList(growable: false);
  }
}

