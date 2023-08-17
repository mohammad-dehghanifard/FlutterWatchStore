import 'package:flutter/material.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class HomeSlider extends StatelessWidget {
  HomeSlider({super.key});

  final images = [
    "https://dcassetcdn.com/design_img/3080524/448887/448887_17051242_3080524_3346df68_image.jpg",
    "https://img.pikbest.com/origin/06/43/34/24HpIkbEsTVvU.jpg!w700wp",
    "https://img.freepik.com/free-vector/dark-style-realistic-smart-watch-horizontal-banner-with-advertising-site-vector-illustration_1284-30193.jpg?w=2000"
  ];
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(Dimens.medium),
          child: SizedBox(
            height: size.height / 5,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.medium),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        // page indicator
        SmoothPageIndicator(
          controller: pageController,
          count:  images.length,
          axisDirection: Axis.horizontal,
          effect:  const WormEffect(
              spacing:  8.0,
              radius:  16,
              dotHeight: 12,
              dotWidth: 12,
              paintStyle:  PaintingStyle.fill,
              activeDotColor:  SolidLightColors.black,
              dotColor: SolidLightColors.gray,
              type: WormType.thin
          ),
        )
      ],
    );
  }
}