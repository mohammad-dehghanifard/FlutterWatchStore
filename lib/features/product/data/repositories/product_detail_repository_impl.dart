import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/product/data/data_source/remote/product_detail_api_provider.dart';
import 'package:flutter_watch_store/features/product/data/model/product_detail_model.dart';
import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';
import 'package:flutter_watch_store/features/product/domain/repositories/product_detail_repository.dart';

class ProductRepositoryImpl extends IProductDetailRepository {
  final ProductDetailApiProvider apiProvider;
  ProductRepositoryImpl(this.apiProvider);
  @override
  Future<ProductDetailEntity?> fetchDetail(int id) async {
    final Response response = await apiProvider.fetchDetail(id);
    if(response.statusCode == 200) {
      final ProductDetailEntity entity = ProductDetail.fromJson(response.data);
      return entity;
    }
    return null;
  }

}