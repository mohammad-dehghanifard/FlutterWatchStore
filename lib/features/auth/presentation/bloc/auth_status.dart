
import 'package:equatable/equatable.dart';

sealed class AuthStatus extends Equatable {
  const AuthStatus();
}

final class AuthInitial extends AuthStatus {
  @override
  List<Object?> get props => [];
}

final class AuthLoading extends AuthStatus {
  @override
  List<Object?> get props => [];
}

final class AuthSendSmsSuccess extends AuthStatus {
  const AuthSendSmsSuccess(this.code);
  final int code;
  @override
  List<Object?> get props => [code];
}

final class AuthCheckSmsSuccess extends AuthStatus {
  const AuthCheckSmsSuccess({required this.registered, required this.token});
  final bool registered;
  final String token;
  @override
  List<Object?> get props => [registered,token];
}

final class AuthError extends AuthStatus {
  const AuthError(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [];
}
