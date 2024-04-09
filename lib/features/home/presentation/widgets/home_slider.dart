import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';


class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final images = [
    "https://img.pikbest.com/origin/06/43/34/24HpIkbEsTVvU.jpg!w700wp",
    "https://cdnb.artstation.com/p/assets/images/images/043/916/283/large/neeraj-kumar-watch-banner.jpg?1638602434",
    "https://img.freepik.com/free-vector/dark-style-realistic-smart-watch-horizontal-banner-with-advertising-site-vector-illustration_1284-30193.jpg?w=2000"
  ];

  final PageController pageController = PageController();
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height / 4.8,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: (value) {
                selectedImage = value;
                setState(() {

                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),
          6.0.height,
          // indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: selectedImage == index? 24 : 12,
                height: selectedImage == index? 8 : 12,
                decoration: BoxDecoration(
                  color: selectedImage == index? Theme.of(context).colorScheme.primary : null,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Theme.of(context).colorScheme.primary)
                ),
              );
            }),
          )
          // page indicator
        ],
      ),
    );
  }
}