part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();
}

final class FetchProductDetailEvent extends ProductDetailEvent {
  final int productId;
  const FetchProductDetailEvent({required this.productId});

  @override
  List<Object?> get props => [productId];

}

final class AddProductToCartEvent extends ProductDetailEvent {
  final int productId;
  const AddProductToCartEvent({required this.productId});
  @override
  List<Object?> get props => [productId];

}
