import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/core/usecase/use_case.dart';
import 'package:flutter_watch_store/features/cart/domain/entities/cart_entity.dart';
import 'package:flutter_watch_store/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:flutter_watch_store/features/cart/presentation/bloc/cart_status.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase cartUseCase;
  CartBloc(this.cartUseCase) : super(CartState(cartStatus: CartInitial())) {

    on<LoadCartEvent>((event, emit) async {
      emit(state.copyWith(newStatus: CartLoading()));
      final CartEntity? cartEntity = await cartUseCase(NoParams());
      if(cartEntity != null) {
        emit(state.copyWith(newStatus: CartSuccess(cartEntity)));
      } else if(cartEntity != null && cartEntity.data == null) {
        emit(state.copyWith(newStatus: const CartEmpty("شماهیچ محصولی به سبد خرید خود اضافه نکردید!")));
      } else {
        emit(state.copyWith(newStatus: const CartError("خطایی رخ داده با پشتیبانی تماس بگیرید!")));
      }
    });

  }
}
