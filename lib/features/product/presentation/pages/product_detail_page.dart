import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/widgets/show_snack_bar.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_bloc.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_cart_status.dart';
import 'package:flutter_watch_store/features/product/presentation/bloc/product_detail_status.dart';
import 'package:flutter_watch_store/features/product/presentation/widgets/product_detail_widget.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimens.bodyMargin),
        child: WatchMainButton(
          onTap: () => di<ProductDetailBloc>().add(AddProductToCartEvent(productId: productId)),
          title: "اضافه کردن به سبد خرید",
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<ProductDetailBloc, ProductDetailState>(
          bloc: di<ProductDetailBloc>()..add(FetchProductDetailEvent(productId: productId)),
          buildWhen: (previous, current) {
            if(previous.detailStatus == current.detailStatus) {
              return false;
            }
            return true;
          },
          listenWhen: (previous, current) {
            if(previous.detailStatus == current.detailStatus && previous.cartStatus == current.cartStatus) {
              return false;
            }
            return true;
          },
          listener: (context, state) {
            // نمایش پیغام اضافه شدن محصول به سبد خرید
            if(state.cartStatus is AddToCartSuccess) {
              final successState = state.cartStatus as AddToCartSuccess;
              ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context: context, content: successState.message));
            }
            // نمایشپ پیغام خطای اضافه شدن محصول به سبد خرید
            if(state.cartStatus is AddToCartError) {
              final successState = state.cartStatus as AddToCartError;
              ScaffoldMessenger.of(context).showSnackBar(
                  buildSnackBar(
                      context: context,
                      type: SnackType.error,
                      content: successState.message));
            }
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
    );
  }
}
