import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/providers/auth_api_provider.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/register_request.dart';
import 'package:flutter_watch_store/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  AuthRepositoryImpl(this.apiProvider);
  final AuthApiProvider apiProvider;

  @override
  Future<Map<String,dynamic>> sendSms(String phoneNumber) async {
    final Response response = await apiProvider.callSendSmsApi(phoneNumber);
    return response.data;
  }

  @override
  Future<Map<String,dynamic>> checkOtpCode(String mobile, String code) async {
    final Response response = await apiProvider.callCheckOtpCode(mobile, code);
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> registerUser(RegisterRequest request) async {
    final Response response = await apiProvider.registerUser(request);
    return response.data;
  }

}