// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerGameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerGameEvent()';
}


}

/// @nodoc
class $PlayerGameEventCopyWith<$Res>  {
$PlayerGameEventCopyWith(PlayerGameEvent _, $Res Function(PlayerGameEvent) __);
}


/// Adds pattern-matching-related methods to [PlayerGameEvent].
extension PlayerGameEventPatterns on PlayerGameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerJoinRequested value)?  joinRequested,TResult Function( PlayerAnswerSelected value)?  answerSelected,TResult Function( PlayerGameQuizUpdated value)?  quizUpdated,TResult Function( PlayerGameParticipantsUpdated value)?  participantsUpdated,TResult Function( PlayerGameServerOffsetUpdated value)?  serverOffsetUpdated,TResult Function( PlayerGameTick value)?  tick,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerJoinRequested() when joinRequested != null:
return joinRequested(_that);case PlayerAnswerSelected() when answerSelected != null:
return answerSelected(_that);case PlayerGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case PlayerGameParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that);case PlayerGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that);case PlayerGameTick() when tick != null:
return tick(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerJoinRequested value)  joinRequested,required TResult Function( PlayerAnswerSelected value)  answerSelected,required TResult Function( PlayerGameQuizUpdated value)  quizUpdated,required TResult Function( PlayerGameParticipantsUpdated value)  participantsUpdated,required TResult Function( PlayerGameServerOffsetUpdated value)  serverOffsetUpdated,required TResult Function( PlayerGameTick value)  tick,}){
final _that = this;
switch (_that) {
case PlayerJoinRequested():
return joinRequested(_that);case PlayerAnswerSelected():
return answerSelected(_that);case PlayerGameQuizUpdated():
return quizUpdated(_that);case PlayerGameParticipantsUpdated():
return participantsUpdated(_that);case PlayerGameServerOffsetUpdated():
return serverOffsetUpdated(_that);case PlayerGameTick():
return tick(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerJoinRequested value)?  joinRequested,TResult? Function( PlayerAnswerSelected value)?  answerSelected,TResult? Function( PlayerGameQuizUpdated value)?  quizUpdated,TResult? Function( PlayerGameParticipantsUpdated value)?  participantsUpdated,TResult? Function( PlayerGameServerOffsetUpdated value)?  serverOffsetUpdated,TResult? Function( PlayerGameTick value)?  tick,}){
final _that = this;
switch (_that) {
case PlayerJoinRequested() when joinRequested != null:
return joinRequested(_that);case PlayerAnswerSelected() when answerSelected != null:
return answerSelected(_that);case PlayerGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case PlayerGameParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that);case PlayerGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that);case PlayerGameTick() when tick != null:
return tick(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String quizId,  String displayName)?  joinRequested,TResult Function( int selectedOptionIndex)?  answerSelected,TResult Function( Quiz quiz)?  quizUpdated,TResult Function( List<Participant> participants)?  participantsUpdated,TResult Function( int offsetMillis)?  serverOffsetUpdated,TResult Function()?  tick,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerJoinRequested() when joinRequested != null:
return joinRequested(_that.quizId,_that.displayName);case PlayerAnswerSelected() when answerSelected != null:
return answerSelected(_that.selectedOptionIndex);case PlayerGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case PlayerGameParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that.participants);case PlayerGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that.offsetMillis);case PlayerGameTick() when tick != null:
return tick();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String quizId,  String displayName)  joinRequested,required TResult Function( int selectedOptionIndex)  answerSelected,required TResult Function( Quiz quiz)  quizUpdated,required TResult Function( List<Participant> participants)  participantsUpdated,required TResult Function( int offsetMillis)  serverOffsetUpdated,required TResult Function()  tick,}) {final _that = this;
switch (_that) {
case PlayerJoinRequested():
return joinRequested(_that.quizId,_that.displayName);case PlayerAnswerSelected():
return answerSelected(_that.selectedOptionIndex);case PlayerGameQuizUpdated():
return quizUpdated(_that.quiz);case PlayerGameParticipantsUpdated():
return participantsUpdated(_that.participants);case PlayerGameServerOffsetUpdated():
return serverOffsetUpdated(_that.offsetMillis);case PlayerGameTick():
return tick();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String quizId,  String displayName)?  joinRequested,TResult? Function( int selectedOptionIndex)?  answerSelected,TResult? Function( Quiz quiz)?  quizUpdated,TResult? Function( List<Participant> participants)?  participantsUpdated,TResult? Function( int offsetMillis)?  serverOffsetUpdated,TResult? Function()?  tick,}) {final _that = this;
switch (_that) {
case PlayerJoinRequested() when joinRequested != null:
return joinRequested(_that.quizId,_that.displayName);case PlayerAnswerSelected() when answerSelected != null:
return answerSelected(_that.selectedOptionIndex);case PlayerGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case PlayerGameParticipantsUpdated() when participantsUpdated != null:
return participantsUpdated(_that.participants);case PlayerGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that.offsetMillis);case PlayerGameTick() when tick != null:
return tick();case _:
  return null;

}
}

}

/// @nodoc


class PlayerJoinRequested implements PlayerGameEvent {
  const PlayerJoinRequested({required this.quizId, required this.displayName});
  

 final  String quizId;
 final  String displayName;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerJoinRequestedCopyWith<PlayerJoinRequested> get copyWith => _$PlayerJoinRequestedCopyWithImpl<PlayerJoinRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerJoinRequested&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,quizId,displayName);

@override
String toString() {
  return 'PlayerGameEvent.joinRequested(quizId: $quizId, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $PlayerJoinRequestedCopyWith<$Res> implements $PlayerGameEventCopyWith<$Res> {
  factory $PlayerJoinRequestedCopyWith(PlayerJoinRequested value, $Res Function(PlayerJoinRequested) _then) = _$PlayerJoinRequestedCopyWithImpl;
@useResult
$Res call({
 String quizId, String displayName
});




}
/// @nodoc
class _$PlayerJoinRequestedCopyWithImpl<$Res>
    implements $PlayerJoinRequestedCopyWith<$Res> {
  _$PlayerJoinRequestedCopyWithImpl(this._self, this._then);

  final PlayerJoinRequested _self;
  final $Res Function(PlayerJoinRequested) _then;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,Object? displayName = null,}) {
  return _then(PlayerJoinRequested(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlayerAnswerSelected implements PlayerGameEvent {
  const PlayerAnswerSelected({required this.selectedOptionIndex});
  

 final  int selectedOptionIndex;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerAnswerSelectedCopyWith<PlayerAnswerSelected> get copyWith => _$PlayerAnswerSelectedCopyWithImpl<PlayerAnswerSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerAnswerSelected&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex));
}


@override
int get hashCode => Object.hash(runtimeType,selectedOptionIndex);

@override
String toString() {
  return 'PlayerGameEvent.answerSelected(selectedOptionIndex: $selectedOptionIndex)';
}


}

/// @nodoc
abstract mixin class $PlayerAnswerSelectedCopyWith<$Res> implements $PlayerGameEventCopyWith<$Res> {
  factory $PlayerAnswerSelectedCopyWith(PlayerAnswerSelected value, $Res Function(PlayerAnswerSelected) _then) = _$PlayerAnswerSelectedCopyWithImpl;
@useResult
$Res call({
 int selectedOptionIndex
});




}
/// @nodoc
class _$PlayerAnswerSelectedCopyWithImpl<$Res>
    implements $PlayerAnswerSelectedCopyWith<$Res> {
  _$PlayerAnswerSelectedCopyWithImpl(this._self, this._then);

  final PlayerAnswerSelected _self;
  final $Res Function(PlayerAnswerSelected) _then;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedOptionIndex = null,}) {
  return _then(PlayerAnswerSelected(
selectedOptionIndex: null == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PlayerGameQuizUpdated implements PlayerGameEvent {
  const PlayerGameQuizUpdated(this.quiz);
  

 final  Quiz quiz;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameQuizUpdatedCopyWith<PlayerGameQuizUpdated> get copyWith => _$PlayerGameQuizUpdatedCopyWithImpl<PlayerGameQuizUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameQuizUpdated&&(identical(other.quiz, quiz) || other.quiz == quiz));
}


@override
int get hashCode => Object.hash(runtimeType,quiz);

@override
String toString() {
  return 'PlayerGameEvent.quizUpdated(quiz: $quiz)';
}


}

/// @nodoc
abstract mixin class $PlayerGameQuizUpdatedCopyWith<$Res> implements $PlayerGameEventCopyWith<$Res> {
  factory $PlayerGameQuizUpdatedCopyWith(PlayerGameQuizUpdated value, $Res Function(PlayerGameQuizUpdated) _then) = _$PlayerGameQuizUpdatedCopyWithImpl;
@useResult
$Res call({
 Quiz quiz
});


$QuizCopyWith<$Res> get quiz;

}
/// @nodoc
class _$PlayerGameQuizUpdatedCopyWithImpl<$Res>
    implements $PlayerGameQuizUpdatedCopyWith<$Res> {
  _$PlayerGameQuizUpdatedCopyWithImpl(this._self, this._then);

  final PlayerGameQuizUpdated _self;
  final $Res Function(PlayerGameQuizUpdated) _then;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quiz = null,}) {
  return _then(PlayerGameQuizUpdated(
null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz,
  ));
}

/// Create a copy of PlayerGameEvent
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


class PlayerGameParticipantsUpdated implements PlayerGameEvent {
  const PlayerGameParticipantsUpdated(final  List<Participant> participants): _participants = participants;
  

 final  List<Participant> _participants;
 List<Participant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameParticipantsUpdatedCopyWith<PlayerGameParticipantsUpdated> get copyWith => _$PlayerGameParticipantsUpdatedCopyWithImpl<PlayerGameParticipantsUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameParticipantsUpdated&&const DeepCollectionEquality().equals(other._participants, _participants));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'PlayerGameEvent.participantsUpdated(participants: $participants)';
}


}

/// @nodoc
abstract mixin class $PlayerGameParticipantsUpdatedCopyWith<$Res> implements $PlayerGameEventCopyWith<$Res> {
  factory $PlayerGameParticipantsUpdatedCopyWith(PlayerGameParticipantsUpdated value, $Res Function(PlayerGameParticipantsUpdated) _then) = _$PlayerGameParticipantsUpdatedCopyWithImpl;
@useResult
$Res call({
 List<Participant> participants
});




}
/// @nodoc
class _$PlayerGameParticipantsUpdatedCopyWithImpl<$Res>
    implements $PlayerGameParticipantsUpdatedCopyWith<$Res> {
  _$PlayerGameParticipantsUpdatedCopyWithImpl(this._self, this._then);

  final PlayerGameParticipantsUpdated _self;
  final $Res Function(PlayerGameParticipantsUpdated) _then;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? participants = null,}) {
  return _then(PlayerGameParticipantsUpdated(
null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,
  ));
}


}

/// @nodoc


class PlayerGameServerOffsetUpdated implements PlayerGameEvent {
  const PlayerGameServerOffsetUpdated(this.offsetMillis);
  

 final  int offsetMillis;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameServerOffsetUpdatedCopyWith<PlayerGameServerOffsetUpdated> get copyWith => _$PlayerGameServerOffsetUpdatedCopyWithImpl<PlayerGameServerOffsetUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameServerOffsetUpdated&&(identical(other.offsetMillis, offsetMillis) || other.offsetMillis == offsetMillis));
}


@override
int get hashCode => Object.hash(runtimeType,offsetMillis);

@override
String toString() {
  return 'PlayerGameEvent.serverOffsetUpdated(offsetMillis: $offsetMillis)';
}


}

/// @nodoc
abstract mixin class $PlayerGameServerOffsetUpdatedCopyWith<$Res> implements $PlayerGameEventCopyWith<$Res> {
  factory $PlayerGameServerOffsetUpdatedCopyWith(PlayerGameServerOffsetUpdated value, $Res Function(PlayerGameServerOffsetUpdated) _then) = _$PlayerGameServerOffsetUpdatedCopyWithImpl;
@useResult
$Res call({
 int offsetMillis
});




}
/// @nodoc
class _$PlayerGameServerOffsetUpdatedCopyWithImpl<$Res>
    implements $PlayerGameServerOffsetUpdatedCopyWith<$Res> {
  _$PlayerGameServerOffsetUpdatedCopyWithImpl(this._self, this._then);

  final PlayerGameServerOffsetUpdated _self;
  final $Res Function(PlayerGameServerOffsetUpdated) _then;

/// Create a copy of PlayerGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offsetMillis = null,}) {
  return _then(PlayerGameServerOffsetUpdated(
null == offsetMillis ? _self.offsetMillis : offsetMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class PlayerGameTick implements PlayerGameEvent {
  const PlayerGameTick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameTick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerGameEvent.tick()';
}


}




/// @nodoc
mixin _$PlayerGameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerGameState()';
}


}

/// @nodoc
class $PlayerGameStateCopyWith<$Res>  {
$PlayerGameStateCopyWith(PlayerGameState _, $Res Function(PlayerGameState) __);
}


/// Adds pattern-matching-related methods to [PlayerGameState].
extension PlayerGameStatePatterns on PlayerGameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerGameInitial value)?  initial,TResult Function( PlayerGameLoading value)?  loading,TResult Function( PlayerGameLoaded value)?  loaded,TResult Function( PlayerGameFailure value)?  failure,TResult Function( PlayerGameRedirectToHost value)?  redirectToHost,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerGameInitial() when initial != null:
return initial(_that);case PlayerGameLoading() when loading != null:
return loading(_that);case PlayerGameLoaded() when loaded != null:
return loaded(_that);case PlayerGameFailure() when failure != null:
return failure(_that);case PlayerGameRedirectToHost() when redirectToHost != null:
return redirectToHost(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerGameInitial value)  initial,required TResult Function( PlayerGameLoading value)  loading,required TResult Function( PlayerGameLoaded value)  loaded,required TResult Function( PlayerGameFailure value)  failure,required TResult Function( PlayerGameRedirectToHost value)  redirectToHost,}){
final _that = this;
switch (_that) {
case PlayerGameInitial():
return initial(_that);case PlayerGameLoading():
return loading(_that);case PlayerGameLoaded():
return loaded(_that);case PlayerGameFailure():
return failure(_that);case PlayerGameRedirectToHost():
return redirectToHost(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerGameInitial value)?  initial,TResult? Function( PlayerGameLoading value)?  loading,TResult? Function( PlayerGameLoaded value)?  loaded,TResult? Function( PlayerGameFailure value)?  failure,TResult? Function( PlayerGameRedirectToHost value)?  redirectToHost,}){
final _that = this;
switch (_that) {
case PlayerGameInitial() when initial != null:
return initial(_that);case PlayerGameLoading() when loading != null:
return loading(_that);case PlayerGameLoaded() when loaded != null:
return loaded(_that);case PlayerGameFailure() when failure != null:
return failure(_that);case PlayerGameRedirectToHost() when redirectToHost != null:
return redirectToHost(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  String selfId,  int questionDurationSeconds,  int secondsRemaining,  bool hasAnsweredCurrentQuestion,  int? selectedOptionIndex,  String? errorMessage)?  loaded,TResult Function( String message)?  failure,TResult Function( String quizId)?  redirectToHost,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerGameInitial() when initial != null:
return initial();case PlayerGameLoading() when loading != null:
return loading();case PlayerGameLoaded() when loaded != null:
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.selfId,_that.questionDurationSeconds,_that.secondsRemaining,_that.hasAnsweredCurrentQuestion,_that.selectedOptionIndex,_that.errorMessage);case PlayerGameFailure() when failure != null:
return failure(_that.message);case PlayerGameRedirectToHost() when redirectToHost != null:
return redirectToHost(_that.quizId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  String selfId,  int questionDurationSeconds,  int secondsRemaining,  bool hasAnsweredCurrentQuestion,  int? selectedOptionIndex,  String? errorMessage)  loaded,required TResult Function( String message)  failure,required TResult Function( String quizId)  redirectToHost,}) {final _that = this;
switch (_that) {
case PlayerGameInitial():
return initial();case PlayerGameLoading():
return loading();case PlayerGameLoaded():
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.selfId,_that.questionDurationSeconds,_that.secondsRemaining,_that.hasAnsweredCurrentQuestion,_that.selectedOptionIndex,_that.errorMessage);case PlayerGameFailure():
return failure(_that.message);case PlayerGameRedirectToHost():
return redirectToHost(_that.quizId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  String selfId,  int questionDurationSeconds,  int secondsRemaining,  bool hasAnsweredCurrentQuestion,  int? selectedOptionIndex,  String? errorMessage)?  loaded,TResult? Function( String message)?  failure,TResult? Function( String quizId)?  redirectToHost,}) {final _that = this;
switch (_that) {
case PlayerGameInitial() when initial != null:
return initial();case PlayerGameLoading() when loading != null:
return loading();case PlayerGameLoaded() when loaded != null:
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.selfId,_that.questionDurationSeconds,_that.secondsRemaining,_that.hasAnsweredCurrentQuestion,_that.selectedOptionIndex,_that.errorMessage);case PlayerGameFailure() when failure != null:
return failure(_that.message);case PlayerGameRedirectToHost() when redirectToHost != null:
return redirectToHost(_that.quizId);case _:
  return null;

}
}

}

/// @nodoc


class PlayerGameInitial implements PlayerGameState {
  const PlayerGameInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerGameState.initial()';
}


}




/// @nodoc


class PlayerGameLoading implements PlayerGameState {
  const PlayerGameLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerGameState.loading()';
}


}




/// @nodoc


class PlayerGameLoaded implements PlayerGameState {
  const PlayerGameLoaded({required this.quizId, required this.status, required this.gameState, required final  List<Question> questions, required final  List<Participant> participants, required this.selfId, required this.questionDurationSeconds, required this.secondsRemaining, required this.hasAnsweredCurrentQuestion, this.selectedOptionIndex, this.errorMessage}): _questions = questions,_participants = participants;
  

 final  String quizId;
 final  QuizStatus status;
 final  GameState gameState;
 final  List<Question> _questions;
 List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

 final  List<Participant> _participants;
 List<Participant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

 final  String selfId;
 final  int questionDurationSeconds;
 final  int secondsRemaining;
 final  bool hasAnsweredCurrentQuestion;
 final  int? selectedOptionIndex;
 final  String? errorMessage;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameLoadedCopyWith<PlayerGameLoaded> get copyWith => _$PlayerGameLoadedCopyWithImpl<PlayerGameLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameLoaded&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.status, status) || other.status == status)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.selfId, selfId) || other.selfId == selfId)&&(identical(other.questionDurationSeconds, questionDurationSeconds) || other.questionDurationSeconds == questionDurationSeconds)&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.hasAnsweredCurrentQuestion, hasAnsweredCurrentQuestion) || other.hasAnsweredCurrentQuestion == hasAnsweredCurrentQuestion)&&(identical(other.selectedOptionIndex, selectedOptionIndex) || other.selectedOptionIndex == selectedOptionIndex)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,quizId,status,gameState,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_participants),selfId,questionDurationSeconds,secondsRemaining,hasAnsweredCurrentQuestion,selectedOptionIndex,errorMessage);

@override
String toString() {
  return 'PlayerGameState.loaded(quizId: $quizId, status: $status, gameState: $gameState, questions: $questions, participants: $participants, selfId: $selfId, questionDurationSeconds: $questionDurationSeconds, secondsRemaining: $secondsRemaining, hasAnsweredCurrentQuestion: $hasAnsweredCurrentQuestion, selectedOptionIndex: $selectedOptionIndex, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PlayerGameLoadedCopyWith<$Res> implements $PlayerGameStateCopyWith<$Res> {
  factory $PlayerGameLoadedCopyWith(PlayerGameLoaded value, $Res Function(PlayerGameLoaded) _then) = _$PlayerGameLoadedCopyWithImpl;
@useResult
$Res call({
 String quizId, QuizStatus status, GameState gameState, List<Question> questions, List<Participant> participants, String selfId, int questionDurationSeconds, int secondsRemaining, bool hasAnsweredCurrentQuestion, int? selectedOptionIndex, String? errorMessage
});


$GameStateCopyWith<$Res> get gameState;

}
/// @nodoc
class _$PlayerGameLoadedCopyWithImpl<$Res>
    implements $PlayerGameLoadedCopyWith<$Res> {
  _$PlayerGameLoadedCopyWithImpl(this._self, this._then);

  final PlayerGameLoaded _self;
  final $Res Function(PlayerGameLoaded) _then;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,Object? status = null,Object? gameState = null,Object? questions = null,Object? participants = null,Object? selfId = null,Object? questionDurationSeconds = null,Object? secondsRemaining = null,Object? hasAnsweredCurrentQuestion = null,Object? selectedOptionIndex = freezed,Object? errorMessage = freezed,}) {
  return _then(PlayerGameLoaded(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,gameState: null == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as GameState,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,selfId: null == selfId ? _self.selfId : selfId // ignore: cast_nullable_to_non_nullable
as String,questionDurationSeconds: null == questionDurationSeconds ? _self.questionDurationSeconds : questionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,secondsRemaining: null == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int,hasAnsweredCurrentQuestion: null == hasAnsweredCurrentQuestion ? _self.hasAnsweredCurrentQuestion : hasAnsweredCurrentQuestion // ignore: cast_nullable_to_non_nullable
as bool,selectedOptionIndex: freezed == selectedOptionIndex ? _self.selectedOptionIndex : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
as int?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStateCopyWith<$Res> get gameState {
  
  return $GameStateCopyWith<$Res>(_self.gameState, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}

/// @nodoc


class PlayerGameFailure implements PlayerGameState {
  const PlayerGameFailure({required this.message});
  

 final  String message;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameFailureCopyWith<PlayerGameFailure> get copyWith => _$PlayerGameFailureCopyWithImpl<PlayerGameFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlayerGameState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $PlayerGameFailureCopyWith<$Res> implements $PlayerGameStateCopyWith<$Res> {
  factory $PlayerGameFailureCopyWith(PlayerGameFailure value, $Res Function(PlayerGameFailure) _then) = _$PlayerGameFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PlayerGameFailureCopyWithImpl<$Res>
    implements $PlayerGameFailureCopyWith<$Res> {
  _$PlayerGameFailureCopyWithImpl(this._self, this._then);

  final PlayerGameFailure _self;
  final $Res Function(PlayerGameFailure) _then;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PlayerGameFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PlayerGameRedirectToHost implements PlayerGameState {
  const PlayerGameRedirectToHost({required this.quizId});
  

 final  String quizId;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerGameRedirectToHostCopyWith<PlayerGameRedirectToHost> get copyWith => _$PlayerGameRedirectToHostCopyWithImpl<PlayerGameRedirectToHost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerGameRedirectToHost&&(identical(other.quizId, quizId) || other.quizId == quizId));
}


@override
int get hashCode => Object.hash(runtimeType,quizId);

@override
String toString() {
  return 'PlayerGameState.redirectToHost(quizId: $quizId)';
}


}

/// @nodoc
abstract mixin class $PlayerGameRedirectToHostCopyWith<$Res> implements $PlayerGameStateCopyWith<$Res> {
  factory $PlayerGameRedirectToHostCopyWith(PlayerGameRedirectToHost value, $Res Function(PlayerGameRedirectToHost) _then) = _$PlayerGameRedirectToHostCopyWithImpl;
@useResult
$Res call({
 String quizId
});




}
/// @nodoc
class _$PlayerGameRedirectToHostCopyWithImpl<$Res>
    implements $PlayerGameRedirectToHostCopyWith<$Res> {
  _$PlayerGameRedirectToHostCopyWithImpl(this._self, this._then);

  final PlayerGameRedirectToHost _self;
  final $Res Function(PlayerGameRedirectToHost) _then;

/// Create a copy of PlayerGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,}) {
  return _then(PlayerGameRedirectToHost(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
