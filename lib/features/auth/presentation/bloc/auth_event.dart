part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class SendSmsEvent extends AuthEvent{
  const SendSmsEvent({required this.phoneNumber});
  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}
