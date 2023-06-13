import 'package:flutter/material.dart';
import 'package:flutter_watch_store/components/text_style.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/dimens.dart';

class WatchAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const WatchAppBar({
    super.key,
    required this.size,
    required this.onIconTap,
    required this.title,
    required this.icon,
  });

  final Size size;
  final String title;
  final Widget icon;
  final Function() onIconTap;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(size.width, size.height * 0.06),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal :Dimens.medium,vertical: Dimens.small),
            color: SolidLightColors.scaffoldColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: LightTextStyle.normalBodyStyle),
                GestureDetector(
                    onTap: onIconTap,
                    child: icon)
              ],
            ),
          ),
        )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height * 0.06);


}