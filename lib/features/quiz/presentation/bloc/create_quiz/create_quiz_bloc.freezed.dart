// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_quiz_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateQuizEvent {

 int get questionCount; int get questionDurationSeconds;
/// Create a copy of CreateQuizEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateQuizEventCopyWith<CreateQuizEvent> get copyWith => _$CreateQuizEventCopyWithImpl<CreateQuizEvent>(this as CreateQuizEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateQuizEvent&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.questionDurationSeconds, questionDurationSeconds) || other.questionDurationSeconds == questionDurationSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,questionCount,questionDurationSeconds);

@override
String toString() {
  return 'CreateQuizEvent(questionCount: $questionCount, questionDurationSeconds: $questionDurationSeconds)';
}


}

/// @nodoc
abstract mixin class $CreateQuizEventCopyWith<$Res>  {
  factory $CreateQuizEventCopyWith(CreateQuizEvent value, $Res Function(CreateQuizEvent) _then) = _$CreateQuizEventCopyWithImpl;
@useResult
$Res call({
 int questionCount, int questionDurationSeconds
});




}
/// @nodoc
class _$CreateQuizEventCopyWithImpl<$Res>
    implements $CreateQuizEventCopyWith<$Res> {
  _$CreateQuizEventCopyWithImpl(this._self, this._then);

  final CreateQuizEvent _self;
  final $Res Function(CreateQuizEvent) _then;

/// Create a copy of CreateQuizEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionCount = null,Object? questionDurationSeconds = null,}) {
  return _then(_self.copyWith(
questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,questionDurationSeconds: null == questionDurationSeconds ? _self.questionDurationSeconds : questionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateQuizEvent].
extension CreateQuizEventPatterns on CreateQuizEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateQuizRequested value)?  createQuizRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateQuizRequested() when createQuizRequested != null:
return createQuizRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateQuizRequested value)  createQuizRequested,}){
final _that = this;
switch (_that) {
case CreateQuizRequested():
return createQuizRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateQuizRequested value)?  createQuizRequested,}){
final _that = this;
switch (_that) {
case CreateQuizRequested() when createQuizRequested != null:
return createQuizRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int questionCount,  int questionDurationSeconds)?  createQuizRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateQuizRequested() when createQuizRequested != null:
return createQuizRequested(_that.questionCount,_that.questionDurationSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int questionCount,  int questionDurationSeconds)  createQuizRequested,}) {final _that = this;
switch (_that) {
case CreateQuizRequested():
return createQuizRequested(_that.questionCount,_that.questionDurationSeconds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int questionCount,  int questionDurationSeconds)?  createQuizRequested,}) {final _that = this;
switch (_that) {
case CreateQuizRequested() when createQuizRequested != null:
return createQuizRequested(_that.questionCount,_that.questionDurationSeconds);case _:
  return null;

}
}

}

/// @nodoc


class CreateQuizRequested implements CreateQuizEvent {
  const CreateQuizRequested({required this.questionCount, required this.questionDurationSeconds});
  

@override final  int questionCount;
@override final  int questionDurationSeconds;

/// Create a copy of CreateQuizEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateQuizRequestedCopyWith<CreateQuizRequested> get copyWith => _$CreateQuizRequestedCopyWithImpl<CreateQuizRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateQuizRequested&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.questionDurationSeconds, questionDurationSeconds) || other.questionDurationSeconds == questionDurationSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,questionCount,questionDurationSeconds);

@override
String toString() {
  return 'CreateQuizEvent.createQuizRequested(questionCount: $questionCount, questionDurationSeconds: $questionDurationSeconds)';
}


}

/// @nodoc
abstract mixin class $CreateQuizRequestedCopyWith<$Res> implements $CreateQuizEventCopyWith<$Res> {
  factory $CreateQuizRequestedCopyWith(CreateQuizRequested value, $Res Function(CreateQuizRequested) _then) = _$CreateQuizRequestedCopyWithImpl;
@override @useResult
$Res call({
 int questionCount, int questionDurationSeconds
});




}
/// @nodoc
class _$CreateQuizRequestedCopyWithImpl<$Res>
    implements $CreateQuizRequestedCopyWith<$Res> {
  _$CreateQuizRequestedCopyWithImpl(this._self, this._then);

  final CreateQuizRequested _self;
  final $Res Function(CreateQuizRequested) _then;

/// Create a copy of CreateQuizEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionCount = null,Object? questionDurationSeconds = null,}) {
  return _then(CreateQuizRequested(
questionCount: null == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,questionDurationSeconds: null == questionDurationSeconds ? _self.questionDurationSeconds : questionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CreateQuizState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateQuizState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateQuizState()';
}


}

/// @nodoc
class $CreateQuizStateCopyWith<$Res>  {
$CreateQuizStateCopyWith(CreateQuizState _, $Res Function(CreateQuizState) __);
}


/// Adds pattern-matching-related methods to [CreateQuizState].
extension CreateQuizStatePatterns on CreateQuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String quizId)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.quizId);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String quizId)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.quizId);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String quizId)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.quizId);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CreateQuizState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateQuizState.initial()';
}


}




/// @nodoc


class _Loading implements CreateQuizState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateQuizState.loading()';
}


}




/// @nodoc


class _Success implements CreateQuizState {
  const _Success({required this.quizId});
  

 final  String quizId;

/// Create a copy of CreateQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.quizId, quizId) || other.quizId == quizId));
}


@override
int get hashCode => Object.hash(runtimeType,quizId);

@override
String toString() {
  return 'CreateQuizState.success(quizId: $quizId)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $CreateQuizStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String quizId
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of CreateQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,}) {
  return _then(_Success(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements CreateQuizState {
  const _Failure({required this.message});
  

 final  String message;

/// Create a copy of CreateQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CreateQuizState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CreateQuizStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of CreateQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
