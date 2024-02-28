import 'package:dio/dio.dart';

class WebService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://watchstore.sasansafari.com/public/api/v1",
      validateStatus: (status) => status! < 500,
    )
  );

  Future<dynamic> getRequest({required String url,Map<String,dynamic>? params}) async {
    return await dio.get(url,queryParameters: params);
  }

  Future<dynamic> postRequest({required String url,Map<String,dynamic>? params}) async{
    return await dio.post(url,queryParameters: params);
}
}