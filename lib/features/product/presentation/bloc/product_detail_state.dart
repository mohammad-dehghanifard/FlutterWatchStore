part of 'product_detail_bloc.dart';

class ProductDetailState {
  final ProductDetailStatus detailStatus;
  ProductDetailState({required this.detailStatus});

  ProductDetailState copyWith(ProductDetailStatus? newStatus){
    return ProductDetailState(detailStatus: newStatus ?? detailStatus);
  }
}
