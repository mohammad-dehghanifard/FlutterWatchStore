import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/widgets/category_item.dart';
import 'package:flutter_watch_store/Features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter_watch_store/Features/home/presentation/widgets/home_slider.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //search bar
            HomeSearchBar(size: size),
            // slider
            HomeSlider(),
            Dimens.large.height,
            // category's
            SizedBox(
              height: size.height / 8,
              child: ListView.builder(
                itemCount: fakeCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  var data = fakeCategory[index];
                    return CategoryItem(
                      title: data[0] as String,
                      imgPath: data[1] as String,
                      gradiant: data[2] as List<Color>,
                    );
                  },
              ),
            )
          ],
        ),
      )
    );
  }
}

final fakeCategory = [
  ["کلاسیک",Assets.svg.clasic,WatchGradiant.lightBrown],
  ["هوشمند",Assets.svg.smart,WatchGradiant.lightGary],
  ["دیجیتال",Assets.svg.digital,WatchGradiant.lightPink],
  ["رومیزی",Assets.svg.smart,WatchGradiant.lightPurple],
];







