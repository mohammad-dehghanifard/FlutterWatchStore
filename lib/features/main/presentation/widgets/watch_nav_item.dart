import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/text_style.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchNavItem extends StatelessWidget {
  const WatchNavItem({
    super.key, required this.title, required this.iconPath,required this.onTap, required this.selected, required this.screenIndex
  });
  final String title;
  final String iconPath;
  final bool selected;
  final int screenIndex;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(Dimens.small - 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                  selected? colorScheme.primary : colorScheme.primaryContainer,
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