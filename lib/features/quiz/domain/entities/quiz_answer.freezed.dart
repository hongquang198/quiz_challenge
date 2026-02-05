// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizAnswer {

 int get questionIndex; int get selectedOptionIndex;/// Epoch millis of the client when answer was locked in (used for scoring).
 int get answeredAt;
/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnswerCopyWith<QuizAnswer> get copyWith => _$QuizAnswerCopyWithImpl<QuizAnswer>(this as QuizAnswer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswer&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,questionIndex,selectedOptionIndex,answeredAt);

@override
String toString() {
  return 'QuizAnswer(questionIndex: $questionIndex, selectedOptionIndex: $selectedOptionIndex, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class $QuizAnswerCopyWith<$Res>  {
  factory $QuizAnswerCopyWith(QuizAnswer value, $Res Function(QuizAnswer) _then) = _$QuizAnswerCopyWithImpl;
@useResult
$Res call({
 int questionIndex, int selectedOptionIndex, int answeredAt
});




}
/// @nodoc
class _$QuizAnswerCopyWithImpl<$Res>
    implements $QuizAnswerCopyWith<$Res> {
  _$QuizAnswerCopyWithImpl(this._self, this._then);

  final QuizAnswer _self;
  final $Res Function(QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionIndex = null,Object? selectedOptionIndex = null,Object? answeredAt = null,}) {
  return _then(_self.copyWith(
questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,selectedOptionIndex: null == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizAnswer].
extension QuizAnswerPatterns on QuizAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAnswer value)  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int questionIndex,  int selectedOptionIndex,  int answeredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.questionIndex,_that.selectedOptionIndex,_that.answeredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int questionIndex,  int selectedOptionIndex,  int answeredAt)  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer():
return $default(_that.questionIndex,_that.selectedOptionIndex,_that.answeredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int questionIndex,  int selectedOptionIndex,  int answeredAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizAnswer() when $default != null:
return $default(_that.questionIndex,_that.selectedOptionIndex,_that.answeredAt);case _:
  return null;

}
}

}

/// @nodoc


class _QuizAnswer implements QuizAnswer {
  const _QuizAnswer({required this.questionIndex, required this.selectedOptionIndex, required this.answeredAt});
  

@override final  int questionIndex;
@override final  int selectedOptionIndex;
/// Epoch millis of the client when answer was locked in (used for scoring).
@override final  int answeredAt;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAnswerCopyWith<_QuizAnswer> get copyWith => __$QuizAnswerCopyWithImpl<_QuizAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAnswer&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}


@override
int get hashCode => Object.hash(runtimeType,questionIndex,selectedOptionIndex,answeredAt);

@override
String toString() {
  return 'QuizAnswer(questionIndex: $questionIndex, selectedOptionIndex: $selectedOptionIndex, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAnswerCopyWith<$Res> implements $QuizAnswerCopyWith<$Res> {
  factory _$QuizAnswerCopyWith(_QuizAnswer value, $Res Function(_QuizAnswer) _then) = __$QuizAnswerCopyWithImpl;
@override @useResult
$Res call({
 int questionIndex, int selectedOptionIndex, int answeredAt
});




}
/// @nodoc
class __$QuizAnswerCopyWithImpl<$Res>
    implements _$QuizAnswerCopyWith<$Res> {
  __$QuizAnswerCopyWithImpl(this._self, this._then);

  final _QuizAnswer _self;
  final $Res Function(_QuizAnswer) _then;

/// Create a copy of QuizAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionIndex = null,Object? selectedOptionIndex = null,Object? answeredAt = null,}) {
  return _then(_QuizAnswer(
questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,selectedOptionIndex: null == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
