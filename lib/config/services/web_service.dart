import 'package:dio/dio.dart';

class WebService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://watchstore.sasansafari.com/public/api/v1",
      validateStatus: (status) => status! < 500,
      headers: {
        "Authorization" : "Bearer "
      }
    )
  );

  Future<Response> getRequest({required String url,Map<String,dynamic>? params}) async {
    final result = await dio.get(url,queryParameters: params);
    return result;
  }

  Future<Response> postRequest({required String url,Map<String,dynamic>? data,FormData? formData}) async{
    final result = await dio.post(url,data: formData ?? data);
    return result;
}
}