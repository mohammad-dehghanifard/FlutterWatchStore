import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_watch_store/features/cart/domain/repositories/cart_repository.dart';

class GetCartUseCase extends UseCase<CartEntity?,NoParams>{
  GetCartUseCase(this.repository);
  final ICartRepository repository;
  @override
  Future<CartEntity?> call(NoParams params) async => await repository.fetchUserCart();

}