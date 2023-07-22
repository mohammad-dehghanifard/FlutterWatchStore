import 'package:flutter/material.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/bottom_nav_index.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/screens/main_screen/widgets/watch_nav_item.dart';

class WatchBottomNav extends StatelessWidget {
  const WatchBottomNav({
    super.key, required this.onTap, required this.index,
  });

  final Function(int newIndex) onTap;
  final int index;

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
            screenIndex: BottomNavIndex.homeIndex,
            title: WatchTexts.homeTxt,
            iconPath: Assets.svg.home,
            selected: index == BottomNavIndex.homeIndex,
            onTap: () => onTap(BottomNavIndex.homeIndex),
          ),
          // basket
          WatchNavItem(
            screenIndex: BottomNavIndex.basketIndex,
            title: WatchTexts.basketTxt,
            iconPath: Assets.svg.basket,
            selected: index == BottomNavIndex.basketIndex,
            onTap: () => onTap(BottomNavIndex.basketIndex),
          ),
          // profile
          WatchNavItem(
            screenIndex: BottomNavIndex.profileIndex,
            title: WatchTexts.profileTxt,
            iconPath: Assets.svg.user,
            selected: index == BottomNavIndex.profileIndex,
            onTap: () => onTap(BottomNavIndex.profileIndex),
          ),
        ],
      ),
    );
  }
}