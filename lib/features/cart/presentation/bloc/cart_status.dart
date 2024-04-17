import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';

sealed class CartStatus extends Equatable {
  const CartStatus();
}

final class CartInitial extends CartStatus {
  @override
  List<Object> get props => [];
}

final class CartLoading extends CartStatus {
  @override
  List<Object> get props => [];
}

final class CartSuccess extends CartStatus {
  final CartEntity cartEntity;
  const CartSuccess(this.cartEntity);
  @override
  List<Object> get props => [];
}

final class CartError extends CartStatus {
  final String errorMessage;
  const CartError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

final class CartEmpty extends CartStatus {
  final String emptyMessage;
  const CartEmpty(this.emptyMessage);
  @override
  List<Object> get props => [emptyMessage];
}
