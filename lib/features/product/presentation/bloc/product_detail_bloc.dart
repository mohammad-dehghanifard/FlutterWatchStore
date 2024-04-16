import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';
import 'package:flutter_watch_store/features/product/domain/usecases/get_product_detail_usecase.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_cart_status.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_status.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final GetProductDetailUseCase useCase;
  ProductDetailBloc(this.useCase) : super(ProductDetailState(detailStatus: ProductDetailLoading(),cartStatus: CartInitial())) {

    on<FetchProductDetailEvent>((event, emit) async {
      final ProductDetailEntity? response = await useCase(event.productId);
      if(response == null || response.result == false){
        emit(state.copyWith(newPageStatus: ProductDetailError(response?.message ?? "خطایی رخ داده لطفا با پشتیبانی تماس بگیرید")));
      } else {
        emit(state.copyWith(newPageStatus: ProductDetailSuccess(response)));
      }
    });
  }
}
