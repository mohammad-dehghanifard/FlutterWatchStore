import 'package:flutter/material.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/features/product/domain/usecases/get_product_detail_usecase.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final usecase = di<GetProductDetailUseCase>();
    usecase(productId);
    return const Scaffold();
  }
}
