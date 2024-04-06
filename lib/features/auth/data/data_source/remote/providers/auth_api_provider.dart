import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';

class AuthApiProvider {
  final WebService _webService = di();

  Future<Response> callSendSmsApi(String phoneNumber) async {
    final Response response = await _webService.postRequest(url: "/send_sms",data: {"mobile" : phoneNumber});
    return response;
  }

  Future<Response> callCheckOtpCode(String mobile,String code) async {
    final Map<String,dynamic> data = {
      "mobile" : mobile,
      "code" : code
    };
    final Response response = await _webService.postRequest(url: "/check_sms_code",data: data);
    return response;
  }


  Future<Response> registerUser({int? phone, String? name, String? address, int? postalCode, double? lat, double? lng}) async {
    final FormData formData = FormData.fromMap({
      "phone": phone,
      "name" : name,
      "address" : address,
      "postal_code" : postalCode,
      "lat" : lat,
      "lnn" : lng,
    });
    final Response response = await _webService.postRequest(url: "/register",formData: formData);
    return response;
  }
}