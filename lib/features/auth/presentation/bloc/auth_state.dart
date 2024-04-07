



part of 'auth_bloc.dart';

class AuthState {
  AuthState({required this.authStatus,required this.registerStatus});
  AuthStatus authStatus;
  RegisterStatus registerStatus;

  AuthState copyWith({AuthStatus? newState,RegisterStatus? newRegisterStatus}) {
    return AuthState(authStatus: newState ?? authStatus,registerStatus: newRegisterStatus ?? registerStatus);
  }
}
