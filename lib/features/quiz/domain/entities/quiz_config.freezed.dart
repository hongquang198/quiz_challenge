// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizConfig {

 String get hostId; QuizStatus get status; int get questionDuration;
/// Create a copy of QuizConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizConfigCopyWith<QuizConfig> get copyWith => _$QuizConfigCopyWithImpl<QuizConfig>(this as QuizConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizConfig&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.status, status) || other.status == status)&&(identical(other.questionDuration, questionDuration) || other.questionDuration == questionDuration));
}


@override
int get hashCode => Object.hash(runtimeType,hostId,status,questionDuration);

@override
String toString() {
  return 'QuizConfig(hostId: $hostId, status: $status, questionDuration: $questionDuration)';
}


}

/// @nodoc
abstract mixin class $QuizConfigCopyWith<$Res>  {
  factory $QuizConfigCopyWith(QuizConfig value, $Res Function(QuizConfig) _then) = _$QuizConfigCopyWithImpl;
@useResult
$Res call({
 String hostId, QuizStatus status, int questionDuration
});




}
/// @nodoc
class _$QuizConfigCopyWithImpl<$Res>
    implements $QuizConfigCopyWith<$Res> {
  _$QuizConfigCopyWithImpl(this._self, this._then);

  final QuizConfig _self;
  final $Res Function(QuizConfig) _then;

/// Create a copy of QuizConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hostId = null,Object? status = null,Object? questionDuration = null,}) {
  return _then(_self.copyWith(
hostId: null == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,questionDuration: null == questionDuration ? _self.questionDuration : questionDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizConfig].
extension QuizConfigPatterns on QuizConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizConfig value)  $default,){
final _that = this;
switch (_that) {
case _QuizConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizConfig value)?  $default,){
final _that = this;
switch (_that) {
case _QuizConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hostId,  QuizStatus status,  int questionDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizConfig() when $default != null:
return $default(_that.hostId,_that.status,_that.questionDuration);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hostId,  QuizStatus status,  int questionDuration)  $default,) {final _that = this;
switch (_that) {
case _QuizConfig():
return $default(_that.hostId,_that.status,_that.questionDuration);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hostId,  QuizStatus status,  int questionDuration)?  $default,) {final _that = this;
switch (_that) {
case _QuizConfig() when $default != null:
return $default(_that.hostId,_that.status,_that.questionDuration);case _:
  return null;

}
}

}

/// @nodoc


class _QuizConfig implements QuizConfig {
  const _QuizConfig({required this.hostId, required this.status, this.questionDuration = 15});
  

@override final  String hostId;
@override final  QuizStatus status;
@override@JsonKey() final  int questionDuration;

/// Create a copy of QuizConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizConfigCopyWith<_QuizConfig> get copyWith => __$QuizConfigCopyWithImpl<_QuizConfig>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizConfig&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.status, status) || other.status == status)&&(identical(other.questionDuration, questionDuration) || other.questionDuration == questionDuration));
}


@override
int get hashCode => Object.hash(runtimeType,hostId,status,questionDuration);

@override
String toString() {
  return 'QuizConfig(hostId: $hostId, status: $status, questionDuration: $questionDuration)';
}


}

/// @nodoc
abstract mixin class _$QuizConfigCopyWith<$Res> implements $QuizConfigCopyWith<$Res> {
  factory _$QuizConfigCopyWith(_QuizConfig value, $Res Function(_QuizConfig) _then) = __$QuizConfigCopyWithImpl;
@override @useResult
$Res call({
 String hostId, QuizStatus status, int questionDuration
});




}
/// @nodoc
class __$QuizConfigCopyWithImpl<$Res>
    implements _$QuizConfigCopyWith<$Res> {
  __$QuizConfigCopyWithImpl(this._self, this._then);

  final _QuizConfig _self;
  final $Res Function(_QuizConfig) _then;

/// Create a copy of QuizConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hostId = null,Object? status = null,Object? questionDuration = null,}) {
  return _then(_QuizConfig(
hostId: null == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,questionDuration: null == questionDuration ? _self.questionDuration : questionDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
