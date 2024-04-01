import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';

class AuthApiProvider {
  final WebService _webService = di();

  Future<dynamic> callSendSmsApi(String phoneNumber) async {
    final Response response = await _webService.postRequest(url: "/send_sms",data: {"mobile" : phoneNumber});
    return response;
  }
}