import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/features/home/data/models/category_model.dart';

class HomeCategoryListItemWidget extends StatelessWidget {
  const HomeCategoryListItemWidget({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    final colorScheme =  Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.bodyMargin,vertical: 8.0),
          child: Text("دسته بندی ها",style: Theme.of(context).textTheme.titleMedium),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.16,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(right: index == 0 ? Dimens.bodyMargin : 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.primaryContainer.withOpacity(0.15),
                        border: Border.all(color: colorScheme.primary,width: 2)
                      ),
                      child: Image.network(categories[index].image ?? ""),
                    ),
                    4.0.height,
                    Text(categories[index].name ?? "")
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
