part of 'lobby_bloc.dart';

@freezed
class LobbyState with _$LobbyState {
  const factory LobbyState.initial() = LobbyInitial;

  const factory LobbyState.loading() = LobbyLoading;

  const factory LobbyState.loaded({
    @Default([]) List<Participant> participants,
    @Default(null) Quiz? quiz,
  }) = LobbyLoaded;

  const factory LobbyState.failure({required String message}) = LobbyFailure;
}
