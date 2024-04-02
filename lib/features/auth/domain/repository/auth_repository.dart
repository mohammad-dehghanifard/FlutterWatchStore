abstract class AuthRepository {
  Future<Map<String,dynamic>> sendSms(String phoneNumber);
  Future<Map<String,dynamic>> checkOtpCode(String mobile,String code);
}