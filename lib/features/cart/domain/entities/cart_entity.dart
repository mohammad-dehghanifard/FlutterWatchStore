import 'package:flutter_watch_store/features/cart/data/models/cart_data.dart';

class CartEntity {

  final bool? result;
  final String? message;
  final CartData? data;

  CartEntity({this.result, this.message, this.data});
}