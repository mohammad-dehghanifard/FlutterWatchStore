import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/config/services/web_service.dart';
import 'package:flutter_watch_store/features/home/data/models/home_model.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';

class HomeApiProvider {
  final WebService _webService = di<WebService>();
  
  Future<HomeEntity?> fetchHomeData() async {
    final Response response = await _webService.getRequest(url: "/home");

    if(response.statusCode == 200) {
      final HomeEntity entity = HomeModel.fromJson(response.data);
      return entity;
    }
    return null;
  }
}