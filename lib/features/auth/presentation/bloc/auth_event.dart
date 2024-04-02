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

final class CheckSmsEvent extends AuthEvent {
  const CheckSmsEvent({required this.phoneNumber,required this.code});
  final String phoneNumber;
  final String code;

  @override
  List<Object?> get props => [code,phoneNumber];

}
