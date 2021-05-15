part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  // ignore: avoid_positional_boolean_parameters
  const factory AuthState(bool loading, String error, bool isLoggedIn) =
      _AuthState;

  factory AuthState.initial() => const AuthState(false, '', false);
}
