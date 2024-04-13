import 'package:equatable/equatable.dart';
import 'package:flutter_watch_store/features/product/domain/entities/product_detail_entity.dart';

sealed class ProductDetailStatus extends Equatable {
  const ProductDetailStatus();
}

final class ProductDetailInitial extends ProductDetailStatus {
  @override
  List<Object> get props => [];
}

final class ProductDetailLoading extends ProductDetailStatus {
  @override
  List<Object> get props => [];
}

final class ProductDetailSuccess extends ProductDetailStatus {
  final ProductDetailEntity detailEntity;
   const ProductDetailSuccess(this.detailEntity);
  @override
  List<Object> get props => [detailEntity];
}

final class ProductDetailError extends ProductDetailStatus {
  final String errorMessage;
  const ProductDetailError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}