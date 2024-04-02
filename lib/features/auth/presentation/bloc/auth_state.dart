



part of 'auth_bloc.dart';

class AuthState {
  AuthState({required this.authStatus});
  AuthStatus authStatus;

  AuthState copyWith({AuthStatus? newState}) {
    return AuthState(authStatus: newState ?? authStatus);
  }
}
