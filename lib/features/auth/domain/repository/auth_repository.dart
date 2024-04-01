abstract class AuthRepository {
  Future<bool> sendSms(String phoneNumber);
  Future<bool> checkOtpCode();
}