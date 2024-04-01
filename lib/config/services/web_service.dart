import 'package:dio/dio.dart';

class WebService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://watchstore.sasansafari.com/public/api/v1",
      validateStatus: (status) => status! < 500,
    )
  );

  Future<Response> getRequest({required String url,Map<String,dynamic>? params}) async {
    final result = await dio.get(url,queryParameters: params);
    return result;
  }

  Future<Response> postRequest({required String url,Map<String,dynamic>? data}) async{
    final result = await dio.post(url,data: data);
    return result;
}
}