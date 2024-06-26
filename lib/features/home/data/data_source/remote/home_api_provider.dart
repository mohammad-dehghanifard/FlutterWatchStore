import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';

class HomeApiProvider {
  final WebService _webService = di<WebService>();
  
  Future<Response> fetchHomeData() async {
    final Response response = await _webService.getRequest(url: "/home");
    return response;
  }
}