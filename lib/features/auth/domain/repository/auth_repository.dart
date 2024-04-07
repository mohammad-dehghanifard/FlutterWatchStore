import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/register_request.dart';

abstract class AuthRepository {
  Future<Map<String,dynamic>> sendSms(String phoneNumber);
  Future<Map<String,dynamic>> checkOtpCode(String mobile,String code);
  Future<Map<String,dynamic>> registerUser(RegisterRequest request);
}