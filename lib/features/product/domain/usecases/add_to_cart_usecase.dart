import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/product/domain/repositories/product_detail_repository.dart';

class AddToCartUseCase extends UseCase<bool,int> {
  AddToCartUseCase(this.repository);
  final IProductDetailRepository repository;
  @override
  Future<bool> call(int params) async => await repository.addProductToCart(params);

}