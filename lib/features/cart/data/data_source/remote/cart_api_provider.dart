import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';

class CartApiProvider{
  CartApiProvider(this.webService);
  final WebService webService;
  
  Future<Response> getUserCart() async {
    final Response response = await webService.postRequest(url: "/user_cart");
    return response;
  }
}