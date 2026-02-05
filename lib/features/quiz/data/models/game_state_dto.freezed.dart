// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameStateDto {

 int get currentQuestionIndex; int get questionStartedAt;
/// Create a copy of GameStateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateDtoCopyWith<GameStateDto> get copyWith => _$GameStateDtoCopyWithImpl<GameStateDto>(this as GameStateDto, _$identity);

  /// Serializes this GameStateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateDto&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.questionStartedAt, questionStartedAt) || other.questionStartedAt == questionStartedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentQuestionIndex,questionStartedAt);

@override
String toString() {
  return 'GameStateDto(currentQuestionIndex: $currentQuestionIndex, questionStartedAt: $questionStartedAt)';
}


}

/// @nodoc
abstract mixin class $GameStateDtoCopyWith<$Res>  {
  factory $GameStateDtoCopyWith(GameStateDto value, $Res Function(GameStateDto) _then) = _$GameStateDtoCopyWithImpl;
@useResult
$Res call({
 int currentQuestionIndex, int questionStartedAt
});




}
/// @nodoc
class _$GameStateDtoCopyWithImpl<$Res>
    implements $GameStateDtoCopyWith<$Res> {
  _$GameStateDtoCopyWithImpl(this._self, this._then);

  final GameStateDto _self;
  final $Res Function(GameStateDto) _then;

/// Create a copy of GameStateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentQuestionIndex = null,Object? questionStartedAt = null,}) {
  return _then(_self.copyWith(
currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,questionStartedAt: null == questionStartedAt ? _self.questionStartedAt : questionStartedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameStateDto].
extension GameStateDtoPatterns on GameStateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameStateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameStateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameStateDto value)  $default,){
final _that = this;
switch (_that) {
case _GameStateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameStateDto value)?  $default,){
final _that = this;
switch (_that) {
case _GameStateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentQuestionIndex,  int questionStartedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameStateDto() when $default != null:
return $default(_that.currentQuestionIndex,_that.questionStartedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentQuestionIndex,  int questionStartedAt)  $default,) {final _that = this;
switch (_that) {
case _GameStateDto():
return $default(_that.currentQuestionIndex,_that.questionStartedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentQuestionIndex,  int questionStartedAt)?  $default,) {final _that = this;
switch (_that) {
case _GameStateDto() when $default != null:
return $default(_that.currentQuestionIndex,_that.questionStartedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameStateDto implements GameStateDto {
  const _GameStateDto({this.currentQuestionIndex = -1, this.questionStartedAt = 0});
  factory _GameStateDto.fromJson(Map<String, dynamic> json) => _$GameStateDtoFromJson(json);

@override@JsonKey() final  int currentQuestionIndex;
@override@JsonKey() final  int questionStartedAt;

/// Create a copy of GameStateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateDtoCopyWith<_GameStateDto> get copyWith => __$GameStateDtoCopyWithImpl<_GameStateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameStateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameStateDto&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&(identical(other.questionStartedAt, questionStartedAt) || other.questionStartedAt == questionStartedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentQuestionIndex,questionStartedAt);

@override
String toString() {
  return 'GameStateDto(currentQuestionIndex: $currentQuestionIndex, questionStartedAt: $questionStartedAt)';
}


}

/// @nodoc
abstract mixin class _$GameStateDtoCopyWith<$Res> implements $GameStateDtoCopyWith<$Res> {
  factory _$GameStateDtoCopyWith(_GameStateDto value, $Res Function(_GameStateDto) _then) = __$GameStateDtoCopyWithImpl;
@override @useResult
$Res call({
 int currentQuestionIndex, int questionStartedAt
});




}
/// @nodoc
class __$GameStateDtoCopyWithImpl<$Res>
    implements _$GameStateDtoCopyWith<$Res> {
  __$GameStateDtoCopyWithImpl(this._self, this._then);

  final _GameStateDto _self;
  final $Res Function(_GameStateDto) _then;

/// Create a copy of GameStateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentQuestionIndex = null,Object? questionStartedAt = null,}) {
  return _then(_GameStateDto(
currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,questionStartedAt: null == questionStartedAt ? _self.questionStartedAt : questionStartedAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
