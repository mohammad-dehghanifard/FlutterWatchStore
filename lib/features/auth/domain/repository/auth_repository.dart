abstract class AuthRepository {
  Future<Map<String,dynamic>> sendSms(String phoneNumber);
  Future<Map<String,dynamic>> checkOtpCode(String mobile,String code);
  Future<Map<String,dynamic>> registerUser({int phone,String name,String address,int postalCode,double lat,double lng});
}