import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';

class ProductDetailApiProvider{
  final WebService _webService = di<WebService>();

  Future<Response> fetchDetail(int id) async {
    final Response response = await _webService.getRequest(url: "/product_details/$id");
    return response;
  }

  Future<Response> addToCart(int id) async {
    final Response response = await _webService.postRequest(url: "/add_to_cart",data: {"product_id" : id});
    return response;
  }

}