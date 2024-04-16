import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/features/product/data/model/product_detail_data.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_bloc.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_status.dart';
import 'package:flutter_watch_store/features/product/presentation/widgets/product_detail_widget.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => di<ProductDetailBloc>()..add(FetchProductDetailEvent(productId: productId)),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Dimens.bodyMargin),
          child: WatchMainButton(
            onTap: () {},
            title: "اضافه کردن به سبد خرید",
          ),
        ),
        body: SafeArea(
          child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
            buildWhen: (previous, current) {
              if(previous.detailStatus == current.detailStatus) {
                return false;
              }
              return true;
            },
            listenWhen: (previous, current) {
              if(previous.detailStatus == current.detailStatus) {
                return false;
              }
              return true;
            },
            listener: (context, state) {

            },
            builder: (context, state) {
              if(state.detailStatus is ProductDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if(state.detailStatus is ProductDetailSuccess) {
                final successState = state.detailStatus as ProductDetailSuccess;
                final product = successState.detailEntity.data?.first;
                return Padding(
                  padding: const EdgeInsets.all(Dimens.bodyMargin),
                  child: SingleChildScrollView(
                    child: ProductDetailWidget(product: product),
                  ),
                );
              } else {
                throw Exception("state invalidate");
              }
            },
          ),
        ),
      ),
    );
  }
}
