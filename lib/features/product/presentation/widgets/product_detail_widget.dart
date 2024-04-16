import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/features/product/data/model/product_detail_data.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
    required this.product,
  });

  final ProductDetailData? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // product image
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(product!.image!),
        ),
        const SizedBox(height: Dimens.medium),
        // price and category
        Row(
          children: [
            // price and brand
            Column(
              children: [
                Text("${product!.price!.toString()} تومان",style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: Dimens.small - 4),
                Text("برند : ${product!.brand}",style: Theme.of(context).textTheme.bodySmall),
              ],
            ),

            const Spacer(),
            // grants and category
            Column(
              children: [
                Text(product!.guaranty!,style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: Dimens.small - 4),
                Text("دسته بندی :${product!.category!}",style: Theme.of(context).textTheme.bodyMedium!.apply(
                    fontSizeFactor: 0.8,
                    color: Theme.of(context).colorScheme.primary
                )),
              ],
            )
          ],
        ),
        Divider(color: Theme.of(context).colorScheme.primaryContainer,thickness: 0.8),
        const SizedBox(height: Dimens.medium),
        Text("رنگ های موجود :",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        // colors
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.07,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: product!.colors!.length,
            itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Dimens.small,
                      vertical: Dimens.medium
                  ),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: Color(_stringToHex(product!.colors![index].code!))
                  ),
                ),
                Text(product!.colors![index].title!)
              ],
            );
          },),
        ),
        Divider(color: Theme.of(context).colorScheme.primaryContainer,thickness: 0.6),
        const SizedBox(height: Dimens.medium),
        Text("ویژگی های محصول:",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: Dimens.small),
        // product properties
        Column(
          children: List.generate(product!.properties!.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(Dimens.small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product!.properties![index].property!,style: Theme.of(context).textTheme.titleSmall),
                  Text(product!.properties![index].value!,style: Theme.of(context).textTheme.bodyMedium!.apply(color: Theme.of(context).colorScheme.primary))
                ],
              ),
            );
          }),
        ),
        // product description
        Divider(color: Theme.of(context).colorScheme.primaryContainer,thickness: 0.6),
        const SizedBox(height: Dimens.medium),
        Text("توضیحات محصول : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        Text(removeHtmlTag(product!.description!)),
        // user comments
        Divider(color: Theme.of(context).colorScheme.primaryContainer,thickness: 0.6),
        const SizedBox(height: Dimens.medium),
        Text("نظرات کاربران : ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: Dimens.medium),
        Row(
          children: List.generate(product!.comments!.take(2).length, (index) {
            return Column(
              children: [
                Text(product!.comments![index].user!,style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: Dimens.small),
                Text(product!.comments![index].body!),
              ],
            );
          }),
        ),
        Center(child: TextButton(onPressed: () {}, child: const Text("مشاهده تمام نظرات"))),
      ],
    );
  }
}

_stringToHex(String hex) {
  hex = hex.replaceFirst('#', '');
  hex = hex.length == 6 ? 'ff$hex' : hex;
  int color = int.parse(hex, radix: 16);
  return color;
}

String removeHtmlTag(String text) {
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}