// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lobby_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LobbyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LobbyEvent()';
}


}

/// @nodoc
class $LobbyEventCopyWith<$Res>  {
$LobbyEventCopyWith(LobbyEvent _, $Res Function(LobbyEvent) __);
}


/// Adds pattern-matching-related methods to [LobbyEvent].
extension LobbyEventPatterns on LobbyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LobbyStarted value)?  started,TResult Function( LobbyParticipantsUpdated value)?  participantsUpdated,TResult Function( LobbyQuizUpdated value)?  quizUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LobbyStarted() when started != null:
return started(_that);case LobbyParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that);case LobbyQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LobbyStarted value)  started,required TResult Function( LobbyParticipantsUpdated value)  participantsUpdated,required TResult Function( LobbyQuizUpdated value)  quizUpdated,}){
final _that = this;
switch (_that) {
case LobbyStarted():
return started(_that);case LobbyParticipantsUpdated():
return participantsUpdated(_that);case LobbyQuizUpdated():
return quizUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LobbyStarted value)?  started,TResult? Function( LobbyParticipantsUpdated value)?  participantsUpdated,TResult? Function( LobbyQuizUpdated value)?  quizUpdated,}){
final _that = this;
switch (_that) {
case LobbyStarted() when started != null:
return started(_that);case LobbyParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that);case LobbyQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String quizId)?  started,TResult Function( List<Participant> participants)?  participantsUpdated,TResult Function( Quiz quiz)?  quizUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LobbyStarted() when started != null:
return started(_that.quizId);case LobbyParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that.participants);case LobbyQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String quizId)  started,required TResult Function( List<Participant> participants)  participantsUpdated,required TResult Function( Quiz quiz)  quizUpdated,}) {final _that = this;
switch (_that) {
case LobbyStarted():
return started(_that.quizId);case LobbyParticipantsUpdated():
return participantsUpdated(_that.participants);case LobbyQuizUpdated():
return quizUpdated(_that.quiz);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String quizId)?  started,TResult? Function( List<Participant> participants)?  participantsUpdated,TResult? Function( Quiz quiz)?  quizUpdated,}) {final _that = this;
switch (_that) {
case LobbyStarted() when started != null:
return started(_that.quizId);case LobbyParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that.participants);case LobbyQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case _:
  return null;

}
}

}

/// @nodoc


class LobbyStarted implements LobbyEvent {
  const LobbyStarted({required this.quizId});
  

 final  String quizId;

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyStartedCopyWith<LobbyStarted> get copyWith => _$LobbyStartedCopyWithImpl<LobbyStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyStarted&&(identical(other.quizId, quizId) || other.quizId == quizId));
}


@override
int get hashCode => Object.hash(runtimeType,quizId);

@override
String toString() {
  return 'LobbyEvent.started(quizId: $quizId)';
}


}

/// @nodoc
abstract mixin class $LobbyStartedCopyWith<$Res> implements $LobbyEventCopyWith<$Res> {
  factory $LobbyStartedCopyWith(LobbyStarted value, $Res Function(LobbyStarted) _then) = _$LobbyStartedCopyWithImpl;
@useResult
$Res call({
 String quizId
});




}
/// @nodoc
class _$LobbyStartedCopyWithImpl<$Res>
    implements $LobbyStartedCopyWith<$Res> {
  _$LobbyStartedCopyWithImpl(this._self, this._then);

  final LobbyStarted _self;
  final $Res Function(LobbyStarted) _then;

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,}) {
  return _then(LobbyStarted(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LobbyParticipantsUpdated implements LobbyEvent {
  const LobbyParticipantsUpdated(final  List<Participant> participants): _participants = participants;
  

 final  List<Participant> _participants;
 List<Participant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyParticipantsUpdatedCopyWith<LobbyParticipantsUpdated> get copyWith => _$LobbyParticipantsUpdatedCopyWithImpl<LobbyParticipantsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyParticipantsUpdated&&const DeepCollectionEquality().equals(other._participants, _participants));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'LobbyEvent.participantsUpdated(participants: $participants)';
}


}

/// @nodoc
abstract mixin class $LobbyParticipantsUpdatedCopyWith<$Res> implements $LobbyEventCopyWith<$Res> {
  factory $LobbyParticipantsUpdatedCopyWith(LobbyParticipantsUpdated value, $Res Function(LobbyParticipantsUpdated) _then) = _$LobbyParticipantsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Participant> participants
});




}
/// @nodoc
class _$LobbyParticipantsUpdatedCopyWithImpl<$Res>
    implements $LobbyParticipantsUpdatedCopyWith<$Res> {
  _$LobbyParticipantsUpdatedCopyWithImpl(this._self, this._then);

  final LobbyParticipantsUpdated _self;
  final $Res Function(LobbyParticipantsUpdated) _then;

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participants = null,}) {
  return _then(LobbyParticipantsUpdated(
null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,
  ));
}


}

/// @nodoc


class LobbyQuizUpdated implements LobbyEvent {
  const LobbyQuizUpdated(this.quiz);
  

 final  Quiz quiz;

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyQuizUpdatedCopyWith<LobbyQuizUpdated> get copyWith => _$LobbyQuizUpdatedCopyWithImpl<LobbyQuizUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyQuizUpdated&&(identical(other.quiz, quiz) || other.quiz == quiz));
}


@override
int get hashCode => Object.hash(runtimeType,quiz);

@override
String toString() {
  return 'LobbyEvent.quizUpdated(quiz: $quiz)';
}


}

/// @nodoc
abstract mixin class $LobbyQuizUpdatedCopyWith<$Res> implements $LobbyEventCopyWith<$Res> {
  factory $LobbyQuizUpdatedCopyWith(LobbyQuizUpdated value, $Res Function(LobbyQuizUpdated) _then) = _$LobbyQuizUpdatedCopyWithImpl;
@useResult
$Res call({
 Quiz quiz
});


$QuizCopyWith<$Res> get quiz;

}
/// @nodoc
class _$LobbyQuizUpdatedCopyWithImpl<$Res>
    implements $LobbyQuizUpdatedCopyWith<$Res> {
  _$LobbyQuizUpdatedCopyWithImpl(this._self, this._then);

  final LobbyQuizUpdated _self;
  final $Res Function(LobbyQuizUpdated) _then;

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quiz = null,}) {
  return _then(LobbyQuizUpdated(
null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz,
  ));
}

/// Create a copy of LobbyEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res> get quiz {
  
  return $QuizCopyWith<$Res>(_self.quiz, (value) {
    return _then(_self.copyWith(quiz: value));
  });
}
}

/// @nodoc
mixin _$LobbyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LobbyState()';
}


}

/// @nodoc
class $LobbyStateCopyWith<$Res>  {
$LobbyStateCopyWith(LobbyState _, $Res Function(LobbyState) __);
}


/// Adds pattern-matching-related methods to [LobbyState].
extension LobbyStatePatterns on LobbyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LobbyInitial value)?  initial,TResult Function( LobbyLoading value)?  loading,TResult Function( LobbyLoaded value)?  loaded,TResult Function( LobbyFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LobbyInitial() when initial != null:
return initial(_that);case LobbyLoading() when loading != null:
return loading(_that);case LobbyLoaded() when loaded != null:
return loaded(_that);case LobbyFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LobbyInitial value)  initial,required TResult Function( LobbyLoading value)  loading,required TResult Function( LobbyLoaded value)  loaded,required TResult Function( LobbyFailure value)  failure,}){
final _that = this;
switch (_that) {
case LobbyInitial():
return initial(_that);case LobbyLoading():
return loading(_that);case LobbyLoaded():
return loaded(_that);case LobbyFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LobbyInitial value)?  initial,TResult? Function( LobbyLoading value)?  loading,TResult? Function( LobbyLoaded value)?  loaded,TResult? Function( LobbyFailure value)?  failure,}){
final _that = this;
switch (_that) {
case LobbyInitial() when initial != null:
return initial(_that);case LobbyLoading() when loading != null:
return loading(_that);case LobbyLoaded() when loaded != null:
return loaded(_that);case LobbyFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Participant> participants,  Quiz? quiz)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LobbyInitial() when initial != null:
return initial();case LobbyLoading() when loading != null:
return loading();case LobbyLoaded() when loaded != null:
return loaded(_that.participants,_that.quiz);case LobbyFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Participant> participants,  Quiz? quiz)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case LobbyInitial():
return initial();case LobbyLoading():
return loading();case LobbyLoaded():
return loaded(_that.participants,_that.quiz);case LobbyFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Participant> participants,  Quiz? quiz)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case LobbyInitial() when initial != null:
return initial();case LobbyLoading() when loading != null:
return loading();case LobbyLoaded() when loaded != null:
return loaded(_that.participants,_that.quiz);case LobbyFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LobbyInitial implements LobbyState {
  const LobbyInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LobbyState.initial()';
}


}




/// @nodoc


class LobbyLoading implements LobbyState {
  const LobbyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LobbyState.loading()';
}


}




/// @nodoc


class LobbyLoaded implements LobbyState {
  const LobbyLoaded({final  List<Participant> participants = const [], this.quiz = null}): _participants = participants;
  

 final  List<Participant> _participants;
@JsonKey() List<Participant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@JsonKey() final  Quiz? quiz;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyLoadedCopyWith<LobbyLoaded> get copyWith => _$LobbyLoadedCopyWithImpl<LobbyLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyLoaded&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.quiz, quiz) || other.quiz == quiz));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participants),quiz);

@override
String toString() {
  return 'LobbyState.loaded(participants: $participants, quiz: $quiz)';
}


}

/// @nodoc
abstract mixin class $LobbyLoadedCopyWith<$Res> implements $LobbyStateCopyWith<$Res> {
  factory $LobbyLoadedCopyWith(LobbyLoaded value, $Res Function(LobbyLoaded) _then) = _$LobbyLoadedCopyWithImpl;
@useResult
$Res call({
 List<Participant> participants, Quiz? quiz
});


$QuizCopyWith<$Res>? get quiz;

}
/// @nodoc
class _$LobbyLoadedCopyWithImpl<$Res>
    implements $LobbyLoadedCopyWith<$Res> {
  _$LobbyLoadedCopyWithImpl(this._self, this._then);

  final LobbyLoaded _self;
  final $Res Function(LobbyLoaded) _then;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participants = null,Object? quiz = freezed,}) {
  return _then(LobbyLoaded(
participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,quiz: freezed == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz?,
  ));
}

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res>? get quiz {
    if (_self.quiz == null) {
    return null;
  }

  return $QuizCopyWith<$Res>(_self.quiz!, (value) {
    return _then(_self.copyWith(quiz: value));
  });
}
}

/// @nodoc


class LobbyFailure implements LobbyState {
  const LobbyFailure({required this.message});
  

 final  String message;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LobbyFailureCopyWith<LobbyFailure> get copyWith => _$LobbyFailureCopyWithImpl<LobbyFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LobbyFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'LobbyState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $LobbyFailureCopyWith<$Res> implements $LobbyStateCopyWith<$Res> {
  factory $LobbyFailureCopyWith(LobbyFailure value, $Res Function(LobbyFailure) _then) = _$LobbyFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LobbyFailureCopyWithImpl<$Res>
    implements $LobbyFailureCopyWith<$Res> {
  _$LobbyFailureCopyWithImpl(this._self, this._then);

  final LobbyFailure _self;
  final $Res Function(LobbyFailure) _then;

/// Create a copy of LobbyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LobbyFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
