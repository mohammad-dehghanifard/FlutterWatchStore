import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/cart/presentation/bloc/cart_status.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartStatus: CartInitial())) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
