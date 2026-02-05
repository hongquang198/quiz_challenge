import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:real_time_quiz/features/quiz/data/repositories/firebase_time_sync_repository.dart';

class _MockFirebaseDatabase extends Mock implements FirebaseDatabase {}

class _MockDatabaseReference extends Mock implements DatabaseReference {}

class _MockDataSnapshot extends Mock implements DataSnapshot {}

class _MockDatabaseEvent extends Mock implements DatabaseEvent {}

void main() {
  group('FirebaseTimeSyncRepository', () {
    late _MockFirebaseDatabase db;
    late _MockDatabaseReference ref;
    late FirebaseTimeSyncRepository repository;

    setUp(() {
      db = _MockFirebaseDatabase();
      ref = _MockDatabaseReference();
      when(() => db.ref(any())).thenReturn(ref);
      repository = FirebaseTimeSyncRepository(db);
    });

    test('watchServerTimeOffsetMillis emits correctly mapped values', () async {
      final event = _MockDatabaseEvent();
      final snapshot = _MockDataSnapshot();

      when(() => ref.onValue).thenAnswer((_) => Stream.value(event));
      when(() => event.snapshot).thenReturn(snapshot);

      // Case 1: int value
      when(() => snapshot.value).thenReturn(1234);
      var result = await repository.watchServerTimeOffsetMillis().first;
      expect(result, 1234);

      // Case 2: num value
      when(() => snapshot.value).thenReturn(567.8);
      result = await repository.watchServerTimeOffsetMillis().first;
      expect(result, 567);

      // Case 3: invalid/null value
      when(() => snapshot.value).thenReturn('invalid');
      result = await repository.watchServerTimeOffsetMillis().first;
      expect(result, 0);
    });
  });
}
