// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answer_submission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnswerSubmission {

 String get userId; QuizAnswer get answer;
/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerSubmissionCopyWith<AnswerSubmission> get copyWith => _$AnswerSubmissionCopyWithImpl<AnswerSubmission>(this as AnswerSubmission, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerSubmission&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,userId,answer);

@override
String toString() {
  return 'AnswerSubmission(userId: $userId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $AnswerSubmissionCopyWith<$Res>  {
  factory $AnswerSubmissionCopyWith(AnswerSubmission value, $Res Function(AnswerSubmission) _then) = _$AnswerSubmissionCopyWithImpl;
@useResult
$Res call({
 String userId, QuizAnswer answer
});


$QuizAnswerCopyWith<$Res> get answer;

}
/// @nodoc
class _$AnswerSubmissionCopyWithImpl<$Res>
    implements $AnswerSubmissionCopyWith<$Res> {
  _$AnswerSubmissionCopyWithImpl(this._self, this._then);

  final AnswerSubmission _self;
  final $Res Function(AnswerSubmission) _then;

/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? answer = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as QuizAnswer,
  ));
}
/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizAnswerCopyWith<$Res> get answer {
  
  return $QuizAnswerCopyWith<$Res>(_self.answer, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}


/// Adds pattern-matching-related methods to [AnswerSubmission].
extension AnswerSubmissionPatterns on AnswerSubmission {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerSubmission value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerSubmission() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerSubmission value)  $default,){
final _that = this;
switch (_that) {
case _AnswerSubmission():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerSubmission value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerSubmission() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  QuizAnswer answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerSubmission() when $default != null:
return $default(_that.userId,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  QuizAnswer answer)  $default,) {final _that = this;
switch (_that) {
case _AnswerSubmission():
return $default(_that.userId,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  QuizAnswer answer)?  $default,) {final _that = this;
switch (_that) {
case _AnswerSubmission() when $default != null:
return $default(_that.userId,_that.answer);case _:
  return null;

}
}

}

/// @nodoc


class _AnswerSubmission implements AnswerSubmission {
  const _AnswerSubmission({required this.userId, required this.answer});
  

@override final  String userId;
@override final  QuizAnswer answer;

/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerSubmissionCopyWith<_AnswerSubmission> get copyWith => __$AnswerSubmissionCopyWithImpl<_AnswerSubmission>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerSubmission&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.answer, answer) || other.answer == answer));
}


@override
int get hashCode => Object.hash(runtimeType,userId,answer);

@override
String toString() {
  return 'AnswerSubmission(userId: $userId, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$AnswerSubmissionCopyWith<$Res> implements $AnswerSubmissionCopyWith<$Res> {
  factory _$AnswerSubmissionCopyWith(_AnswerSubmission value, $Res Function(_AnswerSubmission) _then) = __$AnswerSubmissionCopyWithImpl;
@override @useResult
$Res call({
 String userId, QuizAnswer answer
});


@override $QuizAnswerCopyWith<$Res> get answer;

}
/// @nodoc
class __$AnswerSubmissionCopyWithImpl<$Res>
    implements _$AnswerSubmissionCopyWith<$Res> {
  __$AnswerSubmissionCopyWithImpl(this._self, this._then);

  final _AnswerSubmission _self;
  final $Res Function(_AnswerSubmission) _then;

/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? answer = null,}) {
  return _then(_AnswerSubmission(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as QuizAnswer,
  ));
}

/// Create a copy of AnswerSubmission
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizAnswerCopyWith<$Res> get answer {
  
  return $QuizAnswerCopyWith<$Res>(_self.answer, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}

// dart format on
