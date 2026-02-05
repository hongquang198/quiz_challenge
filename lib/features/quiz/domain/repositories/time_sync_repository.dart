abstract interface class TimeSyncRepository {
  /// Server time offset in millis (Firebase: `/.info/serverTimeOffset` in data layer).
  Stream<int> watchServerTimeOffsetMillis();
}

