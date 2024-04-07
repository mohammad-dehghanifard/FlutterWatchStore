import 'package:dio/dio.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/storage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://watchstore.sasansafari.com/public/api/v1",
      validateStatus: (status) => status! < 500,
    )
  );

  Future<Response> getRequest({required String url,Map<String,dynamic>? params}) async {
    final token = di<SharedPreferences>().getString(StorageKey.token);
    final result = await dio.get(url,queryParameters: params,options: Options(
      headers: {
        if(token != null)
        "Authorization" : "Bearer $token"
      }
    ));
    return result;
  }

  Future<Response> postRequest({required String url,Map<String,dynamic>? data,FormData? formData}) async {
    final token = di<SharedPreferences>().getString(StorageKey.token);
    final result = await dio.post(url,data: formData ?? data,options: Options(
        headers: {
          if(token != null)
            "Authorization" : "Bearer $token"
        }
    ));

    return result;
}


}