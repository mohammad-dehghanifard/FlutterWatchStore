import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';
import 'package:flutter_watch_store/features/auth/data/data_source/remote/requests/register_request.dart';

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


  Future<Response> registerUser(RegisterRequest request) async {
    final FormData formData = FormData.fromMap({
      "phone": request.phone,
      "name" : request.name,
      "address" : request.address,
      "postal_code" : request.postalCod,
      "lat" : request.lat,
      "lnn" : request.lng,
    });
    final Response response = await _webService.postRequest(url: "/register",formData: formData);
    return response;
  }
}