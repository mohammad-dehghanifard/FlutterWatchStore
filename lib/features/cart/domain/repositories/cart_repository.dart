import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';

abstract class ICartRepository {
  Future<CartEntity> fetchUserCart();
}