import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/widgets/product_list_item_widget.dart';
import 'package:flutter_watch_store/features/home/data/models/watch_product_model.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({
    super.key, required this.products,
  });
  final List<WatchProduct> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height / 3.1,
      color: Theme.of(context).colorScheme.primary,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length + 1,
          itemBuilder: (context, index) {
            if(index == 0 ) {
              return
                Padding(
                  padding: const EdgeInsets.all(Dimens.bodyMargin),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.watch,size:64,color: Colors.white),
                    18.0.height,
                    Text("شگفت انگیز",style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white),)
                  ],
                                ),
                );
            } else {
              final WatchProduct product = products[ index - 1];
              return  ProductListItemWidget(product: product);
            }
          },
      ),
    );
  }
}

