part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

final class LoadCartEvent extends CartEvent {
  @override
  List<Object?> get props => [];

}
