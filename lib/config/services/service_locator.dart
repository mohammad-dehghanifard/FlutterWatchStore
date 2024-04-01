import 'package:flutter_watch_store/config/services/web_service.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void injectDi() {
  // services di
  di.registerSingleton<WebService>(WebService());
  // auth di
  di.registerSingleton<AuthApiProvider>(AuthApiProvider());
  di.registerSingleton<AuthRepository>(AuthRepositoryImpl(di()));
  di.registerSingleton<SendSmsUseCase>(SendSmsUseCase(di()));
}