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
                  WatchNavItem(
                    title: WatchTexts.homeTxt,
                    iconPath: Assets.svg.home,
                    selected: true,
                    onTap: () {},
                  )
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
    super.key, required this.title, required this.iconPath,required this.onTap, required this.selected
  });
  final String title;
  final String iconPath;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimens.small - 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                iconPath,
                colorFilter: ColorFilter.mode(
                    selected? SolidLightColors.activeBtnNav : SolidLightColors.deactivateBtnNav,
                    BlendMode.srcIn),
            ),
            Dimens.small.height,
            Text(
                title,
                style: selected? LightTextStyle.activeBottomNav : LightTextStyle.deactivateBottomNav)
          ],
        ),
      ),
    );
  }
}
