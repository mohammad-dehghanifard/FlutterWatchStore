part of 'product_detail_bloc.dart';

class ProductDetailState {
  final ProductDetailStatus detailStatus;
  final ProductDetailCartStatus cartStatus;
  ProductDetailState({required this.detailStatus,required this.cartStatus});

  ProductDetailState copyWith({ProductDetailStatus? newPageStatus,ProductDetailCartStatus? newCartStatus}){
    return ProductDetailState(detailStatus: newPageStatus ?? detailStatus,cartStatus: newCartStatus ?? cartStatus );
  }
}
