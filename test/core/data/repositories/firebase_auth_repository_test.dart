import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_time_quiz/core/data/repositories/firebase_auth_repository.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

class _MockUserCredential extends Mock implements UserCredential {}

class _MockUser extends Mock implements User {}

void main() {
  group('FirebaseAuthRepository', () {
    late _MockFirebaseAuth auth;
    late FirebaseAuthRepository repository;

    setUp(() {
      auth = _MockFirebaseAuth();
      repository = FirebaseAuthRepository(auth);
    });

    test('signInAnonymously returns uid on success', () async {
      final credential = _MockUserCredential();
      final user = _MockUser();

      when(() => auth.signInAnonymously()).thenAnswer((_) async => credential);
      when(() => credential.user).thenReturn(user);
      when(() => user.uid).thenReturn('uid123');

      final result = await repository.signInAnonymously();

      expect(result, 'uid123');
      verify(() => auth.signInAnonymously()).called(1);
    });

    test('currentUserId returns uid when logged in', () {
      final user = _MockUser();
      when(() => auth.currentUser).thenReturn(user);
      when(() => user.uid).thenReturn('uid456');

      final result = repository.currentUserId();

      expect(result, 'uid456');
    });

    test('currentUserId returns null when not logged in', () {
      when(() => auth.currentUser).thenReturn(null);

      final result = repository.currentUserId();

      expect(result, isNull);
    });
  });
}
