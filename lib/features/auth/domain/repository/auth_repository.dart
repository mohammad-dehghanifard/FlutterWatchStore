abstract class AuthRepository {
  Future<Map<String,dynamic>> sendSms(String phoneNumber);
  Future<bool> checkOtpCode(String mobile,String code);
}