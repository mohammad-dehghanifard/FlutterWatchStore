part of 'cart_bloc.dart';

class CartState {
  CartState({required this.cartStatus});
  final CartStatus cartStatus;

  CartState copyWith({CartStatus? newStatus}) {
    return CartState(cartStatus: newStatus ?? cartStatus);
  }
}