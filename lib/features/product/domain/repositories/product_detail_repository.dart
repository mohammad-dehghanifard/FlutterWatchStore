import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';

abstract class IProductDetailRepository {
  Future<ProductDetailEntity?> fetchDetail(int id);
}