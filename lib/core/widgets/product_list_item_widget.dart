import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/features/home/data/models/watch_product_model.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({
    super.key, required this.product,
  });
  final WatchProduct product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: MediaQuery.sizeOf(context).width * 0.40,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.secondaryContainer
      ),
      child: Stack(
        children: [
          // content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(product.image!,scale: 2,),
                6.0.height,
                Text(product.title ?? ""),
                12.0.height,
                // off price
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                       Text("${product.price}تومان",style:  TextStyle(decoration: product.discount! > 0? TextDecoration.lineThrough : null),),
                      if(product.discount! > 0)
                      Text("${product.discountPrice} تومان",style: Theme.of(context).textTheme.titleSmall!.apply(color: Theme.of(context).colorScheme.error),),
                    ],
                  ),
                )
              ],
            ),
          ),
          // off price
          if(product.discount! > 0)
          Positioned(
            left: 5,
            top : 5,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFE53935),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text("${product.discount.toString()}%",style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}