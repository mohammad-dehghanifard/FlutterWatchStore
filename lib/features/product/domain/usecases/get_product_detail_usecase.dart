import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';
import 'package:flutter_watch_store/features/product/domain/repositories/product_detail_repository.dart';

class GetProductDetailUseCase extends UseCase<ProductDetailEntity?,int> {
  final IProductDetailRepository repository;
  GetProductDetailUseCase(this.repository);
  @override
  Future<ProductDetailEntity?> call(int params) => repository.fetchDetail(params);

}