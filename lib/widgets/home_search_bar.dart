import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_watch_store/resources/dimens.dart';

import '../components/text_style.dart';
import '../gen/assets.gen.dart';
import '../resources/colors.dart';
import '../resources/texts.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimens.medium),
      width: size.width,
      height: size.height / 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: SolidLightColors.searchBar,
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              offset: Offset(0,3),
              color: SolidLightColors.searchShadow
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(Assets.svg.search),
          Text(WatchTexts.searchHintTxt,style: LightTextStyle.formHintStyle),
          Image.asset(Assets.png.mainLogo.path,scale: 4)
        ],
      ),
    );
  }
}