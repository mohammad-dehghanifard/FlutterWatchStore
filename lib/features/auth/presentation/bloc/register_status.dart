import 'package:equatable/equatable.dart';

sealed class RegisterStatus extends Equatable {}

final class RegisterInitial extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

final class RegisterLoading extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

final class RegisterSuccess extends RegisterStatus {
  @override
  List<Object?> get props => [];
}

final class RegisterError extends RegisterStatus {
  RegisterError(this.errorMsg);
  final String errorMsg;
  @override
  List<Object?> get props => [errorMsg];
}

