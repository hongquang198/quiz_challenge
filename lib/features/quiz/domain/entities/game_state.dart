import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    /// -1 until game starts; 0..n during gameplay.
    @Default(-1) int currentQuestionIndex,

    /// Epoch millis (server-synced) when the current question started.
    @Default(0) int questionStartedAt,
  }) = _GameState;
}

