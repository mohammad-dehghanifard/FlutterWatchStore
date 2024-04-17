import 'package:equatable/equatable.dart';

sealed class CartStatus extends Equatable {
  const CartStatus();
}

final class CartInitial extends CartStatus {
  @override
  List<Object> get props => [];
}
