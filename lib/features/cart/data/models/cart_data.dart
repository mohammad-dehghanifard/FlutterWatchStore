import 'package:flutter_watch_store/features/cart/data/models/user_cart.dart';

class CartData {
  List<UserCart>? userCart;
  int? cartTotalPrice;
  int? totalWithoutDiscountPrice;

  CartData({this.userCart, this.cartTotalPrice, this.totalWithoutDiscountPrice});

  CartData.fromJson(Map<String, dynamic> json) {
    if (json['user_cart'] != null) {
      userCart = <UserCart>[];
      json['user_cart'].forEach((v) {
        userCart!.add(UserCart.fromJson(v));
      });
    }
    cartTotalPrice = json['cart_total_price'];
    totalWithoutDiscountPrice = json['total_without_discount_price'];
  }


}