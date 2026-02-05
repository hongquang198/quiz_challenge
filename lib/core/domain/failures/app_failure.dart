import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
sealed class AppFailure with _$AppFailure implements Exception {
  const factory AppFailure.unknown([String? message]) = _Unknown;
  const factory AppFailure.network([String? message]) = _Network;
  const factory AppFailure.permissionDenied([String? message]) =
      _PermissionDenied;
  const factory AppFailure.notFound([String? message]) = _NotFound;
  const factory AppFailure.validation([String? message]) = _Validation;
  const factory AppFailure.conflict([String? message]) = _Conflict;
}
