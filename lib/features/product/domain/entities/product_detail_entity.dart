import 'package:flutter_watch_store/features/product/data/model/product_detail_data.dart';

class ProductDetailEntity {
  ProductDetailEntity({this.data,this.message,this.result});
  final bool? result;
  final String? message;
  final List<ProductDetailData>? data;
}