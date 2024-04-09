import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height / 3.2,
      color: Theme.of(context).colorScheme.primary,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
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
              return const ProductListItemWidget();
            }
          },
      ),
    );
  }
}

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget({
    super.key,
  });

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
                Image.network("https://watchstore.sasansafari.com/public/images/product/small/1654350887.png",scale: 2,),
                const Text("ساعت مچی عقربه ای مردانه سیکو SRQ015J1"),
                12.0.height,
                // off price
                 Align(
                   alignment: Alignment.topLeft,
                   child: Column(
                    children: [
                      const Text("900,000,00 تومان",style: TextStyle(decoration: TextDecoration.lineThrough),),
                      Text("441,000,00 تومان",style: Theme.of(context).textTheme.titleSmall!.apply(color: Theme.of(context).colorScheme.error),),
                    ],
                                         ),
                 )
              ],
            ),
          ),
          // off price
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
              child: Center(child: Text("51%",style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}