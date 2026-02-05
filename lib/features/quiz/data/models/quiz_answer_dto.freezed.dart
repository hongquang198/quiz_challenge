// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_answer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizAnswerDto {

 int get questionIndex; int get selectedOptionIndex; int get answeredAt;
/// Create a copy of QuizAnswerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizAnswerDtoCopyWith<QuizAnswerDto> get copyWith => _$QuizAnswerDtoCopyWithImpl<QuizAnswerDto>(this as QuizAnswerDto, _$identity);

  /// Serializes this QuizAnswerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizAnswerDto&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionIndex,selectedOptionIndex,answeredAt);

@override
String toString() {
  return 'QuizAnswerDto(questionIndex: $questionIndex, selectedOptionIndex: $selectedOptionIndex, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class $QuizAnswerDtoCopyWith<$Res>  {
  factory $QuizAnswerDtoCopyWith(QuizAnswerDto value, $Res Function(QuizAnswerDto) _then) = _$QuizAnswerDtoCopyWithImpl;
@useResult
$Res call({
 int questionIndex, int selectedOptionIndex, int answeredAt
});




}
/// @nodoc
class _$QuizAnswerDtoCopyWithImpl<$Res>
    implements $QuizAnswerDtoCopyWith<$Res> {
  _$QuizAnswerDtoCopyWithImpl(this._self, this._then);

  final QuizAnswerDto _self;
  final $Res Function(QuizAnswerDto) _then;

/// Create a copy of QuizAnswerDto
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


/// Adds pattern-matching-related methods to [QuizAnswerDto].
extension QuizAnswerDtoPatterns on QuizAnswerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizAnswerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizAnswerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizAnswerDto value)  $default,){
final _that = this;
switch (_that) {
case _QuizAnswerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizAnswerDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuizAnswerDto() when $default != null:
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
case _QuizAnswerDto() when $default != null:
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
case _QuizAnswerDto():
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
case _QuizAnswerDto() when $default != null:
return $default(_that.questionIndex,_that.selectedOptionIndex,_that.answeredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizAnswerDto implements QuizAnswerDto {
  const _QuizAnswerDto({required this.questionIndex, required this.selectedOptionIndex, required this.answeredAt});
  factory _QuizAnswerDto.fromJson(Map<String, dynamic> json) => _$QuizAnswerDtoFromJson(json);

@override final  int questionIndex;
@override final  int selectedOptionIndex;
@override final  int answeredAt;

/// Create a copy of QuizAnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizAnswerDtoCopyWith<_QuizAnswerDto> get copyWith => __$QuizAnswerDtoCopyWithImpl<_QuizAnswerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizAnswerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizAnswerDto&&(identical(other.questionIndex, questionIndex) || other.questionIndex == questionIndex)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.answeredAt, answeredAt) || other.answeredAt == answeredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionIndex,selectedOptionIndex,answeredAt);

@override
String toString() {
  return 'QuizAnswerDto(questionIndex: $questionIndex, selectedOptionIndex: $selectedOptionIndex, answeredAt: $answeredAt)';
}


}

/// @nodoc
abstract mixin class _$QuizAnswerDtoCopyWith<$Res> implements $QuizAnswerDtoCopyWith<$Res> {
  factory _$QuizAnswerDtoCopyWith(_QuizAnswerDto value, $Res Function(_QuizAnswerDto) _then) = __$QuizAnswerDtoCopyWithImpl;
@override @useResult
$Res call({
 int questionIndex, int selectedOptionIndex, int answeredAt
});




}
/// @nodoc
class __$QuizAnswerDtoCopyWithImpl<$Res>
    implements _$QuizAnswerDtoCopyWith<$Res> {
  __$QuizAnswerDtoCopyWithImpl(this._self, this._then);

  final _QuizAnswerDto _self;
  final $Res Function(_QuizAnswerDto) _then;

/// Create a copy of QuizAnswerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionIndex = null,Object? selectedOptionIndex = null,Object? answeredAt = null,}) {
  return _then(_QuizAnswerDto(
questionIndex: null == questionIndex ? _self.questionIndex : questionIndex // ignore: cast_nullable_to_non_nullable
as int,selectedOptionIndex: null == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int,answeredAt: null == answeredAt ? _self.answeredAt : answeredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
