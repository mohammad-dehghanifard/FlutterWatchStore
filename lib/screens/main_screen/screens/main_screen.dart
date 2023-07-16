import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/components/text_style.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // screen
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: size.height * 0.1,
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.lightGreen,
            ),
          ),

          // bottom navigation
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.1,
              color: SolidLightColors.bottomNav,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WatchNavItem()
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class WatchNavItem extends StatelessWidget {
  const WatchNavItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.svg.home),
        Dimens.small.height,
        Text(WatchTexts.homeTxt,style: LightTextStyle.activeBottomNav)
      ],
    );
  }
}
