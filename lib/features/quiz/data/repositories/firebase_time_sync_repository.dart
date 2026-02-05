import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/time_sync_repository.dart';
import '../datasources/rtdb_refs.dart';

@LazySingleton(as: TimeSyncRepository)
class FirebaseTimeSyncRepository implements TimeSyncRepository {
  FirebaseTimeSyncRepository(FirebaseDatabase db) : _refs = RtdbRefs(db);

  final RtdbRefs _refs;

  @override
  Stream<int> watchServerTimeOffsetMillis() {
    return _refs.serverTimeOffset().onValue.map((event) {
      final value = event.snapshot.value;
      if (value is int) return value;
      if (value is num) return value.toInt();
      return 0;
    });
  }
}

