import 'package:flutter_watch_store/features/product/data/model/product_detail_data.dart';

class ProductDetail {
  bool? result;
  String? message;
  List<ProductDetailData>? data;

  ProductDetail({this.result, this.message, this.data});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductDetailData>[];
      json['data'].forEach((v) {
        data!.add(ProductDetailData.fromJson(v));
      });
    }
  }

}






