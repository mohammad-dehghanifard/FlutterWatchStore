import 'package:dio/dio.dart';
import 'package:flutter_watch_store/features/cart/data/data_source/remote/cart_api_provider.dart';
import 'package:flutter_watch_store/features/cart/data/models/cart_model.dart';
import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_watch_store/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl extends ICartRepository {
  CartRepositoryImpl(this.apiProvider);
  final CartApiProvider apiProvider;

  @override
  Future<CartEntity?> fetchUserCart() async {
    final Response response = await apiProvider.getUserCart();
    if(response.statusCode == 200){
      final CartEntity cartEntity = CartModel.fromJson(response.data);
      return cartEntity;
    }
    return null;
  }

}