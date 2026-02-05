// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParticipantDto {

 String get name; int get score;
/// Create a copy of ParticipantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantDtoCopyWith<ParticipantDto> get copyWith => _$ParticipantDtoCopyWithImpl<ParticipantDto>(this as ParticipantDto, _$identity);

  /// Serializes this ParticipantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantDto&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score);

@override
String toString() {
  return 'ParticipantDto(name: $name, score: $score)';
}


}

/// @nodoc
abstract mixin class $ParticipantDtoCopyWith<$Res>  {
  factory $ParticipantDtoCopyWith(ParticipantDto value, $Res Function(ParticipantDto) _then) = _$ParticipantDtoCopyWithImpl;
@useResult
$Res call({
 String name, int score
});




}
/// @nodoc
class _$ParticipantDtoCopyWithImpl<$Res>
    implements $ParticipantDtoCopyWith<$Res> {
  _$ParticipantDtoCopyWithImpl(this._self, this._then);

  final ParticipantDto _self;
  final $Res Function(ParticipantDto) _then;

/// Create a copy of ParticipantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? score = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ParticipantDto].
extension ParticipantDtoPatterns on ParticipantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantDto value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantDto value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantDto() when $default != null:
return $default(_that.name,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int score)  $default,) {final _that = this;
switch (_that) {
case _ParticipantDto():
return $default(_that.name,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int score)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantDto() when $default != null:
return $default(_that.name,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantDto implements ParticipantDto {
  const _ParticipantDto({required this.name, this.score = 0});
  factory _ParticipantDto.fromJson(Map<String, dynamic> json) => _$ParticipantDtoFromJson(json);

@override final  String name;
@override@JsonKey() final  int score;

/// Create a copy of ParticipantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantDtoCopyWith<_ParticipantDto> get copyWith => __$ParticipantDtoCopyWithImpl<_ParticipantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantDto&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score);

@override
String toString() {
  return 'ParticipantDto(name: $name, score: $score)';
}


}

/// @nodoc
abstract mixin class _$ParticipantDtoCopyWith<$Res> implements $ParticipantDtoCopyWith<$Res> {
  factory _$ParticipantDtoCopyWith(_ParticipantDto value, $Res Function(_ParticipantDto) _then) = __$ParticipantDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, int score
});




}
/// @nodoc
class __$ParticipantDtoCopyWithImpl<$Res>
    implements _$ParticipantDtoCopyWith<$Res> {
  __$ParticipantDtoCopyWithImpl(this._self, this._then);

  final _ParticipantDto _self;
  final $Res Function(_ParticipantDto) _then;

/// Create a copy of ParticipantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? score = null,}) {
  return _then(_ParticipantDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
