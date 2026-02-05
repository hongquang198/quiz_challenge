// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HostGameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HostGameEvent()';
}


}

/// @nodoc
class $HostGameEventCopyWith<$Res>  {
$HostGameEventCopyWith(HostGameEvent _, $Res Function(HostGameEvent) __);
}


/// Adds pattern-matching-related methods to [HostGameEvent].
extension HostGameEventPatterns on HostGameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HostGameStarted value)?  started,TResult Function( HostNextQuestionRequested value)?  nextQuestionRequested,TResult Function( HostStartGame value)?  startGame,TResult Function( HostGameQuizUpdated value)?  quizUpdated,TResult Function( HostGameAnswerReceived value)?  answerReceived,TResult Function( HostGameServerOffsetUpdated value)?  serverOffsetUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HostGameStarted() when started != null:
return started(_that);case HostNextQuestionRequested() when nextQuestionRequested != null:
return nextQuestionRequested(_that);case HostStartGame() when startGame != null:
return startGame(_that);case HostGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case HostGameAnswerReceived() when answerReceived != null:
return answerReceived(_that);case HostGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HostGameStarted value)  started,required TResult Function( HostNextQuestionRequested value)  nextQuestionRequested,required TResult Function( HostStartGame value)  startGame,required TResult Function( HostGameQuizUpdated value)  quizUpdated,required TResult Function( HostGameAnswerReceived value)  answerReceived,required TResult Function( HostGameServerOffsetUpdated value)  serverOffsetUpdated,}){
final _that = this;
switch (_that) {
case HostGameStarted():
return started(_that);case HostNextQuestionRequested():
return nextQuestionRequested(_that);case HostStartGame():
return startGame(_that);case HostGameQuizUpdated():
return quizUpdated(_that);case HostGameAnswerReceived():
return answerReceived(_that);case HostGameServerOffsetUpdated():
return serverOffsetUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HostGameStarted value)?  started,TResult? Function( HostNextQuestionRequested value)?  nextQuestionRequested,TResult? Function( HostStartGame value)?  startGame,TResult? Function( HostGameQuizUpdated value)?  quizUpdated,TResult? Function( HostGameAnswerReceived value)?  answerReceived,TResult? Function( HostGameServerOffsetUpdated value)?  serverOffsetUpdated,}){
final _that = this;
switch (_that) {
case HostGameStarted() when started != null:
return started(_that);case HostNextQuestionRequested() when nextQuestionRequested != null:
return nextQuestionRequested(_that);case HostStartGame() when startGame != null:
return startGame(_that);case HostGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that);case HostGameAnswerReceived() when answerReceived != null:
return answerReceived(_that);case HostGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String quizId)?  started,TResult Function()?  nextQuestionRequested,TResult Function()?  startGame,TResult Function( Quiz quiz)?  quizUpdated,TResult Function( AnswerSubmission submission)?  answerReceived,TResult Function( int offsetMillis)?  serverOffsetUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HostGameStarted() when started != null:
return started(_that.quizId);case HostNextQuestionRequested() when nextQuestionRequested != null:
return nextQuestionRequested();case HostStartGame() when startGame != null:
return startGame();case HostGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case HostGameAnswerReceived() when answerReceived != null:
return answerReceived(_that.submission);case HostGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that.offsetMillis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String quizId)  started,required TResult Function()  nextQuestionRequested,required TResult Function()  startGame,required TResult Function( Quiz quiz)  quizUpdated,required TResult Function( AnswerSubmission submission)  answerReceived,required TResult Function( int offsetMillis)  serverOffsetUpdated,}) {final _that = this;
switch (_that) {
case HostGameStarted():
return started(_that.quizId);case HostNextQuestionRequested():
return nextQuestionRequested();case HostStartGame():
return startGame();case HostGameQuizUpdated():
return quizUpdated(_that.quiz);case HostGameAnswerReceived():
return answerReceived(_that.submission);case HostGameServerOffsetUpdated():
return serverOffsetUpdated(_that.offsetMillis);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String quizId)?  started,TResult? Function()?  nextQuestionRequested,TResult? Function()?  startGame,TResult? Function( Quiz quiz)?  quizUpdated,TResult? Function( AnswerSubmission submission)?  answerReceived,TResult? Function( int offsetMillis)?  serverOffsetUpdated,}) {final _that = this;
switch (_that) {
case HostGameStarted() when started != null:
return started(_that.quizId);case HostNextQuestionRequested() when nextQuestionRequested != null:
return nextQuestionRequested();case HostStartGame() when startGame != null:
return startGame();case HostGameQuizUpdated() when quizUpdated != null:
return quizUpdated(_that.quiz);case HostGameAnswerReceived() when answerReceived != null:
return answerReceived(_that.submission);case HostGameServerOffsetUpdated() when serverOffsetUpdated != null:
return serverOffsetUpdated(_that.offsetMillis);case _:
  return null;

}
}

}

/// @nodoc


class HostGameStarted implements HostGameEvent {
  const HostGameStarted({required this.quizId});
  

 final  String quizId;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameStartedCopyWith<HostGameStarted> get copyWith => _$HostGameStartedCopyWithImpl<HostGameStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameStarted&&(identical(other.quizId, quizId) || other.quizId == quizId));
}


@override
int get hashCode => Object.hash(runtimeType,quizId);

@override
String toString() {
  return 'HostGameEvent.started(quizId: $quizId)';
}


}

/// @nodoc
abstract mixin class $HostGameStartedCopyWith<$Res> implements $HostGameEventCopyWith<$Res> {
  factory $HostGameStartedCopyWith(HostGameStarted value, $Res Function(HostGameStarted) _then) = _$HostGameStartedCopyWithImpl;
@useResult
$Res call({
 String quizId
});




}
/// @nodoc
class _$HostGameStartedCopyWithImpl<$Res>
    implements $HostGameStartedCopyWith<$Res> {
  _$HostGameStartedCopyWithImpl(this._self, this._then);

  final HostGameStarted _self;
  final $Res Function(HostGameStarted) _then;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,}) {
  return _then(HostGameStarted(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HostNextQuestionRequested implements HostGameEvent {
  const HostNextQuestionRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostNextQuestionRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HostGameEvent.nextQuestionRequested()';
}


}




/// @nodoc


class HostStartGame implements HostGameEvent {
  const HostStartGame();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostStartGame);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HostGameEvent.startGame()';
}


}




/// @nodoc


class HostGameQuizUpdated implements HostGameEvent {
  const HostGameQuizUpdated(this.quiz);
  

 final  Quiz quiz;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameQuizUpdatedCopyWith<HostGameQuizUpdated> get copyWith => _$HostGameQuizUpdatedCopyWithImpl<HostGameQuizUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameQuizUpdated&&(identical(other.quiz, quiz) || other.quiz == quiz));
}


@override
int get hashCode => Object.hash(runtimeType,quiz);

@override
String toString() {
  return 'HostGameEvent.quizUpdated(quiz: $quiz)';
}


}

/// @nodoc
abstract mixin class $HostGameQuizUpdatedCopyWith<$Res> implements $HostGameEventCopyWith<$Res> {
  factory $HostGameQuizUpdatedCopyWith(HostGameQuizUpdated value, $Res Function(HostGameQuizUpdated) _then) = _$HostGameQuizUpdatedCopyWithImpl;
@useResult
$Res call({
 Quiz quiz
});


$QuizCopyWith<$Res> get quiz;

}
/// @nodoc
class _$HostGameQuizUpdatedCopyWithImpl<$Res>
    implements $HostGameQuizUpdatedCopyWith<$Res> {
  _$HostGameQuizUpdatedCopyWithImpl(this._self, this._then);

  final HostGameQuizUpdated _self;
  final $Res Function(HostGameQuizUpdated) _then;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quiz = null,}) {
  return _then(HostGameQuizUpdated(
null == quiz ? _self.quiz : quiz // ignore: cast_nullable_to_non_nullable
as Quiz,
  ));
}

/// Create a copy of HostGameEvent
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


class HostGameAnswerReceived implements HostGameEvent {
  const HostGameAnswerReceived(this.submission);
  

 final  AnswerSubmission submission;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameAnswerReceivedCopyWith<HostGameAnswerReceived> get copyWith => _$HostGameAnswerReceivedCopyWithImpl<HostGameAnswerReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameAnswerReceived&&(identical(other.submission, submission) || other.submission == submission));
}


@override
int get hashCode => Object.hash(runtimeType,submission);

@override
String toString() {
  return 'HostGameEvent.answerReceived(submission: $submission)';
}


}

/// @nodoc
abstract mixin class $HostGameAnswerReceivedCopyWith<$Res> implements $HostGameEventCopyWith<$Res> {
  factory $HostGameAnswerReceivedCopyWith(HostGameAnswerReceived value, $Res Function(HostGameAnswerReceived) _then) = _$HostGameAnswerReceivedCopyWithImpl;
@useResult
$Res call({
 AnswerSubmission submission
});


$AnswerSubmissionCopyWith<$Res> get submission;

}
/// @nodoc
class _$HostGameAnswerReceivedCopyWithImpl<$Res>
    implements $HostGameAnswerReceivedCopyWith<$Res> {
  _$HostGameAnswerReceivedCopyWithImpl(this._self, this._then);

  final HostGameAnswerReceived _self;
  final $Res Function(HostGameAnswerReceived) _then;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? submission = null,}) {
  return _then(HostGameAnswerReceived(
null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as AnswerSubmission,
  ));
}

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnswerSubmissionCopyWith<$Res> get submission {
  
  return $AnswerSubmissionCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}

/// @nodoc


class HostGameServerOffsetUpdated implements HostGameEvent {
  const HostGameServerOffsetUpdated(this.offsetMillis);
  

 final  int offsetMillis;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameServerOffsetUpdatedCopyWith<HostGameServerOffsetUpdated> get copyWith => _$HostGameServerOffsetUpdatedCopyWithImpl<HostGameServerOffsetUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameServerOffsetUpdated&&(identical(other.offsetMillis, offsetMillis) || other.offsetMillis == offsetMillis));
}


@override
int get hashCode => Object.hash(runtimeType,offsetMillis);

@override
String toString() {
  return 'HostGameEvent.serverOffsetUpdated(offsetMillis: $offsetMillis)';
}


}

/// @nodoc
abstract mixin class $HostGameServerOffsetUpdatedCopyWith<$Res> implements $HostGameEventCopyWith<$Res> {
  factory $HostGameServerOffsetUpdatedCopyWith(HostGameServerOffsetUpdated value, $Res Function(HostGameServerOffsetUpdated) _then) = _$HostGameServerOffsetUpdatedCopyWithImpl;
@useResult
$Res call({
 int offsetMillis
});




}
/// @nodoc
class _$HostGameServerOffsetUpdatedCopyWithImpl<$Res>
    implements $HostGameServerOffsetUpdatedCopyWith<$Res> {
  _$HostGameServerOffsetUpdatedCopyWithImpl(this._self, this._then);

  final HostGameServerOffsetUpdated _self;
  final $Res Function(HostGameServerOffsetUpdated) _then;

/// Create a copy of HostGameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offsetMillis = null,}) {
  return _then(HostGameServerOffsetUpdated(
null == offsetMillis ? _self.offsetMillis : offsetMillis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$HostGameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HostGameState()';
}


}

/// @nodoc
class $HostGameStateCopyWith<$Res>  {
$HostGameStateCopyWith(HostGameState _, $Res Function(HostGameState) __);
}


/// Adds pattern-matching-related methods to [HostGameState].
extension HostGameStatePatterns on HostGameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HostGameInitial value)?  initial,TResult Function( HostGameLoading value)?  loading,TResult Function( HostGameLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HostGameInitial() when initial != null:
return initial(_that);case HostGameLoading() when loading != null:
return loading(_that);case HostGameLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HostGameInitial value)  initial,required TResult Function( HostGameLoading value)  loading,required TResult Function( HostGameLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case HostGameInitial():
return initial(_that);case HostGameLoading():
return loading(_that);case HostGameLoaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HostGameInitial value)?  initial,TResult? Function( HostGameLoading value)?  loading,TResult? Function( HostGameLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case HostGameInitial() when initial != null:
return initial(_that);case HostGameLoading() when loading != null:
return loading(_that);case HostGameLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String quizId)?  loading,TResult Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  int questionDurationSeconds,  String? errorMessage)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HostGameInitial() when initial != null:
return initial();case HostGameLoading() when loading != null:
return loading(_that.quizId);case HostGameLoaded() when loaded != null:
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.questionDurationSeconds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String quizId)  loading,required TResult Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  int questionDurationSeconds,  String? errorMessage)  loaded,}) {final _that = this;
switch (_that) {
case HostGameInitial():
return initial();case HostGameLoading():
return loading(_that.quizId);case HostGameLoaded():
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.questionDurationSeconds,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String quizId)?  loading,TResult? Function( String quizId,  QuizStatus status,  GameState gameState,  List<Question> questions,  List<Participant> participants,  int questionDurationSeconds,  String? errorMessage)?  loaded,}) {final _that = this;
switch (_that) {
case HostGameInitial() when initial != null:
return initial();case HostGameLoading() when loading != null:
return loading(_that.quizId);case HostGameLoaded() when loaded != null:
return loaded(_that.quizId,_that.status,_that.gameState,_that.questions,_that.participants,_that.questionDurationSeconds,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class HostGameInitial implements HostGameState {
  const HostGameInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HostGameState.initial()';
}


}




/// @nodoc


class HostGameLoading implements HostGameState {
  const HostGameLoading({required this.quizId});
  

 final  String quizId;

/// Create a copy of HostGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameLoadingCopyWith<HostGameLoading> get copyWith => _$HostGameLoadingCopyWithImpl<HostGameLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameLoading&&(identical(other.quizId, quizId) || other.quizId == quizId));
}


@override
int get hashCode => Object.hash(runtimeType,quizId);

@override
String toString() {
  return 'HostGameState.loading(quizId: $quizId)';
}


}

/// @nodoc
abstract mixin class $HostGameLoadingCopyWith<$Res> implements $HostGameStateCopyWith<$Res> {
  factory $HostGameLoadingCopyWith(HostGameLoading value, $Res Function(HostGameLoading) _then) = _$HostGameLoadingCopyWithImpl;
@useResult
$Res call({
 String quizId
});




}
/// @nodoc
class _$HostGameLoadingCopyWithImpl<$Res>
    implements $HostGameLoadingCopyWith<$Res> {
  _$HostGameLoadingCopyWithImpl(this._self, this._then);

  final HostGameLoading _self;
  final $Res Function(HostGameLoading) _then;

/// Create a copy of HostGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,}) {
  return _then(HostGameLoading(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HostGameLoaded implements HostGameState {
  const HostGameLoaded({required this.quizId, required this.status, required this.gameState, required final  List<Question> questions, required final  List<Participant> participants, required this.questionDurationSeconds, this.errorMessage}): _questions = questions,_participants = participants;
  

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

 final  int questionDurationSeconds;
 final  String? errorMessage;

/// Create a copy of HostGameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HostGameLoadedCopyWith<HostGameLoaded> get copyWith => _$HostGameLoadedCopyWithImpl<HostGameLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HostGameLoaded&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.status, status) || other.status == status)&&(identical(other.gameState, gameState) || other.gameState == gameState)&&const DeepCollectionEquality().equals(other._questions, _questions)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.questionDurationSeconds, questionDurationSeconds) || other.questionDurationSeconds == questionDurationSeconds)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,quizId,status,gameState,const DeepCollectionEquality().hash(_questions),const DeepCollectionEquality().hash(_participants),questionDurationSeconds,errorMessage);

@override
String toString() {
  return 'HostGameState.loaded(quizId: $quizId, status: $status, gameState: $gameState, questions: $questions, participants: $participants, questionDurationSeconds: $questionDurationSeconds, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HostGameLoadedCopyWith<$Res> implements $HostGameStateCopyWith<$Res> {
  factory $HostGameLoadedCopyWith(HostGameLoaded value, $Res Function(HostGameLoaded) _then) = _$HostGameLoadedCopyWithImpl;
@useResult
$Res call({
 String quizId, QuizStatus status, GameState gameState, List<Question> questions, List<Participant> participants, int questionDurationSeconds, String? errorMessage
});


$GameStateCopyWith<$Res> get gameState;

}
/// @nodoc
class _$HostGameLoadedCopyWithImpl<$Res>
    implements $HostGameLoadedCopyWith<$Res> {
  _$HostGameLoadedCopyWithImpl(this._self, this._then);

  final HostGameLoaded _self;
  final $Res Function(HostGameLoaded) _then;

/// Create a copy of HostGameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quizId = null,Object? status = null,Object? gameState = null,Object? questions = null,Object? participants = null,Object? questionDurationSeconds = null,Object? errorMessage = freezed,}) {
  return _then(HostGameLoaded(
quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,gameState: null == gameState ? _self.gameState : gameState // ignore: cast_nullable_to_non_nullable
as GameState,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<Participant>,questionDurationSeconds: null == questionDurationSeconds ? _self.questionDurationSeconds : questionDurationSeconds // ignore: cast_nullable_to_non_nullable
as int,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HostGameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameStateCopyWith<$Res> get gameState {
  
  return $GameStateCopyWith<$Res>(_self.gameState, (value) {
    return _then(_self.copyWith(gameState: value));
  });
}
}

// dart format on
