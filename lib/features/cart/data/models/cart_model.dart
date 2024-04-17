import 'package:flutter_watch_store/features/cart/data/models/cart_data.dart';

class CartModel {
  bool? result;
  String? message;
  CartData? data;

  CartModel({this.result, this.message, this.data});

  CartModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }

}




