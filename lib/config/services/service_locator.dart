import 'package:flutter_watch_store/config/services/web_service.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/providers/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/check_otp_usecase.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_watch_store/features/auth/presentation/forms/register_forms.dart';
import 'package:flutter_watch_store/features/home/data/data_source/remote/home_api_provider.dart';
import 'package:flutter_watch_store/features/home/data/repository/home_repository_impl.dart';
import 'package:flutter_watch_store/features/home/domain/repository/home_repository.dart';
import 'package:flutter_watch_store/features/home/domain/usecase/home_usecase.dart';
import 'package:flutter_watch_store/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_watch_store/features/product/data/data_source/remote/product_detail_api_provider.dart';
import 'package:flutter_watch_store/features/product/data/repositories/product_detail_repository_impl.dart';
import 'package:flutter_watch_store/features/product/domain/repositories/product_detail_repository.dart';
import 'package:flutter_watch_store/features/product/domain/usecases/add_to_cart_usecase.dart';
import 'package:flutter_watch_store/features/product/domain/usecases/get_product_detail_usecase.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_bloc.dart';
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
  di.registerSingleton<RegisterUseCase>(RegisterUseCase(di()));
  di.registerSingleton<AuthBloc>(AuthBloc(checkKOtpUseCase: di(),sendSmsUseCase: di(),registerUseCase: di()));
  di.registerSingleton<RegisterForms>(RegisterForms());

  // Home di
  di.registerSingleton<HomeApiProvider>(HomeApiProvider());
  di.registerSingleton<IHomeRepository>(HomeRepositoryImpl(di()));
  di.registerSingleton<HomeUseCase>(HomeUseCase(di()));
  di.registerSingleton<HomeBloc>(HomeBloc(di()));

  // Product detail di
  di.registerSingleton<ProductDetailApiProvider>(ProductDetailApiProvider());
  di.registerSingleton<IProductDetailRepository>(ProductRepositoryImpl(di()));
  di.registerSingleton<GetProductDetailUseCase>(GetProductDetailUseCase(di()));
  di.registerSingleton<AddToCartUseCase>(AddToCartUseCase(di()));
  di.registerSingleton<ProductDetailBloc>(ProductDetailBloc(di(),di()));

}