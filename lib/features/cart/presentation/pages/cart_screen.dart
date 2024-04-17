import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_watch_store/features/cart/presentation/bloc/cart_status.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.bodyMargin),
      child: Column(
          children: [
            Center(child: Text("سبد خرید",style: Theme.of(context).textTheme.titleMedium)),
            BlocConsumer<CartBloc,CartState>(
              bloc: di<CartBloc>()..add(LoadCartEvent()),
              listener: (context, state) {

              },
              builder: (context, state) {

                if(state.cartStatus is CartLoading) {
                  const Center(child: CircularProgressIndicator());
                } else if (state.cartStatus is CartSuccess) {
                  final currentState = state.cartStatus as CartSuccess;
                  final cartEntity = currentState.cartEntity;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartEntity.data!.userCart!.length,
                          itemBuilder: (context, index) {
                            final userCart = cartEntity.data!.userCart![index];
                            return Padding(
                              padding: const EdgeInsets.all(Dimens.medium),
                              child: Row(
                                children: [
                                  // image
                                  SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Image.network("https://watchstore.sasansafari.com/public/images/product/small/1654350873.png"),
                                  ),
                                  // title and id
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.sizeOf(context).width / 1.9,
                                            child: Text(userCart.product!,overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                        const SizedBox(height: Dimens.medium),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("شناسه محصول : ${userCart.productId}"),
                                            Text("تعداد : ${userCart.productId}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // cart info
                        Container(
                          padding: const EdgeInsets.all(Dimens.bodyMargin),
                          width: MediaQuery.sizeOf(context).width,
                          decoration:   BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.secondaryContainer
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("مبلغ کل :",style: Theme.of(context).textTheme.titleMedium),
                                  Text("${cartEntity.data!.cartTotalPrice} تومان",style: Theme.of(context).textTheme.titleSmall),
                                ],
                              ),
                              Divider(color: Theme.of(context).colorScheme.primary),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("مبلغ نهایی با تخفیف :",style: Theme.of(context).textTheme.titleMedium),
                                  Text("${cartEntity.data!.totalWithoutDiscountPrice} تومان",style: Theme.of(context).textTheme.titleSmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Dimens.large),
                        // button
                        WatchMainButton(title: "پرداخت و نهایی سازی سفارش", onTap: () {})

                      ],
                    ),
                  );
                } else if( state.cartStatus is CartEmpty){
                  return const Text("سبد خرید شما خالی است...");
                }
                  return Container();



              },
            )
          ],
        ),
    );
  }
}
