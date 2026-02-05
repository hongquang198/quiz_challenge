// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizDto {

 QuizConfigDto get config; GameStateDto get gameState; Map<String, QuestionDto> get questions;
/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizDtoCopyWith<QuizDto> get copyWith => _$QuizDtoCopyWithImpl<QuizDto>(this as QuizDto, _$identity);

  /// Serializes this QuizDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizDto&&(identical(other.config, config) || other.config == config)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,config,gameState,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'QuizDto(config: $config, gameState: $gameState, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $QuizDtoCopyWith<$Res>  {
  factory $QuizDtoCopyWith(QuizDto value, $Res Function(QuizDto) _then) = _$QuizDtoCopyWithImpl;
@useResult
$Res call({
 QuizConfigDto config, GameStateDto gameState, Map<String, QuestionDto> questions
});


$QuizConfigDtoCopyWith<$Res> get config;$GameStateDtoCopyWith<$Res> get gameState;

}
/// @nodoc
class _$QuizDtoCopyWithImpl<$Res>
    implements $QuizDtoCopyWith<$Res> {
  _$QuizDtoCopyWithImpl(this._self, this._then);

  final QuizDto _self;
  final $Res Function(QuizDto) _then;

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? config = null,Object? gameState = null,Object? questions = null,}) {
  return _then(_self.copyWith(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as QuizConfigDto,gameState: null == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as GameStateDto,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as Map<String, QuestionDto>,
  ));
}
/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizConfigDtoCopyWith<$Res> get config {
  
  return $QuizConfigDtoCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStateDtoCopyWith<$Res> get gameState {
  
  return $GameStateDtoCopyWith<$Res>(_self.gameState, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizDto].
extension QuizDtoPatterns on QuizDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizDto value)  $default,){
final _that = this;
switch (_that) {
case _QuizDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizDto value)?  $default,){
final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuizConfigDto config,  GameStateDto gameState,  Map<String, QuestionDto> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
return $default(_that.config,_that.gameState,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuizConfigDto config,  GameStateDto gameState,  Map<String, QuestionDto> questions)  $default,) {final _that = this;
switch (_that) {
case _QuizDto():
return $default(_that.config,_that.gameState,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuizConfigDto config,  GameStateDto gameState,  Map<String, QuestionDto> questions)?  $default,) {final _that = this;
switch (_that) {
case _QuizDto() when $default != null:
return $default(_that.config,_that.gameState,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizDto implements QuizDto {
  const _QuizDto({required this.config, required this.gameState, final  Map<String, QuestionDto> questions = const <String, QuestionDto>{}}): _questions = questions;
  factory _QuizDto.fromJson(Map<String, dynamic> json) => _$QuizDtoFromJson(json);

@override final  QuizConfigDto config;
@override final  GameStateDto gameState;
 final  Map<String, QuestionDto> _questions;
@override@JsonKey() Map<String, QuestionDto> get questions {
  if (_questions is EqualUnmodifiableMapView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_questions);
}


/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizDtoCopyWith<_QuizDto> get copyWith => __$QuizDtoCopyWithImpl<_QuizDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizDto&&(identical(other.config, config) || other.config == config)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,config,gameState,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'QuizDto(config: $config, gameState: $gameState, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$QuizDtoCopyWith<$Res> implements $QuizDtoCopyWith<$Res> {
  factory _$QuizDtoCopyWith(_QuizDto value, $Res Function(_QuizDto) _then) = __$QuizDtoCopyWithImpl;
@override @useResult
$Res call({
 QuizConfigDto config, GameStateDto gameState, Map<String, QuestionDto> questions
});


@override $QuizConfigDtoCopyWith<$Res> get config;@override $GameStateDtoCopyWith<$Res> get gameState;

}
/// @nodoc
class __$QuizDtoCopyWithImpl<$Res>
    implements _$QuizDtoCopyWith<$Res> {
  __$QuizDtoCopyWithImpl(this._self, this._then);

  final _QuizDto _self;
  final $Res Function(_QuizDto) _then;

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? config = null,Object? gameState = null,Object? questions = null,}) {
  return _then(_QuizDto(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as QuizConfigDto,gameState: null == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as GameStateDto,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as Map<String, QuestionDto>,
  ));
}

/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizConfigDtoCopyWith<$Res> get config {
  
  return $QuizConfigDtoCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}/// Create a copy of QuizDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStateDtoCopyWith<$Res> get gameState {
  
  return $GameStateDtoCopyWith<$Res>(_self.gameState, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}

// dart format on
