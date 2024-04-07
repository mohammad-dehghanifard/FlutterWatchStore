import 'package:flutter_watch_store/config/services/web_service.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/providers/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/check_otp_usecase.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

void injectDi() async {

  //locale storage di
  di.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

  // services di
  di.registerSingleton<WebService>(WebService());

  // auth di
  di.registerSingleton<AuthApiProvider>(AuthApiProvider());
  di.registerSingleton<AuthRepository>(AuthRepositoryImpl(di()));
  di.registerSingleton<SendSmsUseCase>(SendSmsUseCase(di()));
  di.registerSingleton<CheckKOtpUseCase>(CheckKOtpUseCase(di()));
  di.registerSingleton<AuthBloc>(AuthBloc(checkKOtpUseCase: di(),sendSmsUseCase: di()));
}