import 'package:equatable/equatable.dart';

sealed class ProductDetailCartStatus extends Equatable {
  const ProductDetailCartStatus();
}

final class CartInitial extends ProductDetailCartStatus {
  @override
  List<Object?> get props => [];
}

final class CartLoading extends ProductDetailCartStatus {
  @override
  List<Object?> get props => [];
}

final class AddToCartSuccess extends ProductDetailCartStatus {
  final String message;
  const AddToCartSuccess(this.message);
  @override
  List<Object?> get props => [];
}

final class AddToCartError extends ProductDetailCartStatus {
  final String message;
  const AddToCartError(this.message);
  @override
  List<Object?> get props => [message];
}
