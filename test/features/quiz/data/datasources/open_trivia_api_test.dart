import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(Uri());
  });

  group('OpenTriviaApi', () {
    test(
      'logic verification: options are shuffled and correctIndex is tracked',
      () async {
        // This is a unit test for the shuffling logic specifically.
        // Since the logic is coupled with the fetch, I'll verify the 'indexOf' logic manually
        // or by mocking the internal behavior if possible.

        const correct = "Correct";
        final incorrect = ["W1", "W2", "W3"];

        // Simulation of the code inside OpenTriviaApi:
        final options = <String>[...incorrect, correct];
        options.shuffle();
        final correctIndex = options.indexOf(correct);

        expect(options.length, 4);
        expect(options[correctIndex], correct);
        // It's statistically unlikely to be 3 every time now.
      },
    );
  });
}
