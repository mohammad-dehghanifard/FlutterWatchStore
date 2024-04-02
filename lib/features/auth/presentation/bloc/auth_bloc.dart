import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendSmsUseCase sendSmsUseCase;
  AuthBloc({required this.sendSmsUseCase}) : super(AuthState(authStatus: AuthInitial())) {

    on<SendSmsEvent>((event, emit) async {
      emit(state.copyWith(newState: AuthLoading()));
      final response = await sendSmsUseCase(event.phoneNumber);
      if(response["result"]) {
        emit(state.copyWith(newState: AuthSendSmsSuccess(response["data"]["code"])));
      } else {
        emit(state.copyWith(newState: AuthError(response["message"])));
      }
      emit(state.copyWith(newState: AuthInitial()));
    });
  }
}
