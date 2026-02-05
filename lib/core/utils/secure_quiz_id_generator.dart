import 'dart:math';

import 'package:injectable/injectable.dart';

import '../domain/services/quiz_id_generator.dart';

@LazySingleton(as: QuizIdGenerator)
class SecureQuizIdGenerator implements QuizIdGenerator {
  static const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  final Random _random = Random.secure();

  @override
  String generate() {
    final buffer = StringBuffer();
    for (var i = 0; i < 6; i++) {
      buffer.write(_chars[_random.nextInt(_chars.length)]);
    }
    return buffer.toString();
  }
}

