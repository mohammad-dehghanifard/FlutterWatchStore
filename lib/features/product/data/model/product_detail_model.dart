import 'package:flutter_watch_store/features/product/data/model/product_detail_data.dart';
import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';

class ProductDetail extends ProductDetailEntity {


  ProductDetail({
    bool? result,
    String? message,
    List<ProductDetailData>? data,
  }) : super(data: data, message: message, result: result);

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    final data = <ProductDetailData>[];
    json['data'].forEach((v) {
      data.add(ProductDetailData.fromJson(v));
    });
    return ProductDetail(
      result: json['result'],
      message: json['message'],
      data: data

    );
  }

}






