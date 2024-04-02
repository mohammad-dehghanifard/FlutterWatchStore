import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/providers/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  AuthRepositoryImpl(this.apiProvider);
  final AuthApiProvider apiProvider;

  @override
  Future<Map<String,dynamic>> sendSms(String phoneNumber) async {
    final Response response = await apiProvider.callSendSmsApi(phoneNumber);
    print("repo ::: ${response.data}");
    return response.data;
  }

  @override
  Future<bool> checkOtpCode(String mobile, String code) async {
    final Response response = await apiProvider.callCheckOtpCode(mobile, code);
    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

}