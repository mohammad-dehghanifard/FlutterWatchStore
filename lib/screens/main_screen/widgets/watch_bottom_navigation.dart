import 'package:flutter/material.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/screens/main_screen/widgets/watch_nav_item.dart';

class WatchBottomNav extends StatelessWidget {
  const WatchBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width,
      height: size.height * 0.1,
      color: SolidLightColors.bottomNav,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // home
          WatchNavItem(
            title: WatchTexts.homeTxt,
            iconPath: Assets.svg.home,
            selected: true,
            onTap: () {},
          ),
          // basket
          WatchNavItem(
            title: WatchTexts.basketTxt,
            iconPath: Assets.svg.basket,
            selected: false,
            onTap: () {},
          ),
          // profile
          WatchNavItem(
            title: WatchTexts.profileTxt,
            iconPath: Assets.svg.user,
            selected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}