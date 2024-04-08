import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/check_otp_request.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/register_request.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/check_otp_usecase.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_status.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/register_status.dart';
import '../../domain/usecases/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendSmsUseCase sendSmsUseCase;
  final CheckKOtpUseCase checkKOtpUseCase;
  final RegisterUseCase registerUseCase;
  AuthBloc({required this.sendSmsUseCase,required this.checkKOtpUseCase,required this.registerUseCase}) : super(AuthState(authStatus: AuthInitial(),registerStatus: RegisterInitial())) {

    on<SendSmsEvent>((event, emit) async {
      emit(state.copyWith(newState: AuthLoading()));
      final response = await sendSmsUseCase(event.phoneNumber);
      if(response["result"] == true) {
        emit(state.copyWith(newState: AuthSendSmsSuccess(response["data"]["code"])));
      } else {
        emit(state.copyWith(newState: AuthError(response["message"])));

      }
      emit(state.copyWith(newState: AuthInitial()));
    });

    on<CheckSmsEvent>((event,emit) async {
      emit(state.copyWith(newState: AuthLoading()));
      final params = CheckOtpRequest(mobile: event.phoneNumber,code: event.code);
      final response = await checkKOtpUseCase(params);
      if(response["result"] == true) {
        emit(state.copyWith(newState: AuthCheckSmsSuccess(registered:response['data']['is_registered'],token:  response["data"]['token'])));
      } else {
        emit(state.copyWith(newState: AuthError(response['message'])));
      }
      emit(state.copyWith(newState: AuthInitial()));
    });

    on<RegisterEvent>((event,emit) async {
      emit(state.copyWith(newRegisterStatus: RegisterLoading()));
      final response = await registerUseCase(event.registerRequest);
      print(response);
      if(response["result"] == true) {
        emit(state.copyWith(newRegisterStatus: RegisterSuccess()));
      } else {
        emit(state.copyWith(newRegisterStatus: RegisterError(response["message"])));
      }
      emit(state.copyWith(newRegisterStatus: RegisterInitial()));
    }


    );
  }
}
