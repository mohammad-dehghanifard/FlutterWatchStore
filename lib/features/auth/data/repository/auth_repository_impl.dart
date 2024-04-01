import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  AuthRepositoryImpl(this.apiProvider);
  final AuthApiProvider apiProvider;

  @override
  Future<bool> sendSms(String phoneNumber) async {
    final Response response = await apiProvider.callSendSmsApi(phoneNumber);
    print(response);
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> checkOtpCode() async {
    return false;
  }



}