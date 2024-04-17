import 'package:flutter_watch_store/features/cart/data/models/cart_data.dart';
import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {


  CartModel({
    bool? result,
    String? message,
    CartData? data,
  }) : super(
      result: result,
      message: message,
      data: data
  );

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      result: json['result'],
      message: json['message'],
      data: json['data'] != null ? CartData.fromJson(json['data']) : null
    );
  }

}


