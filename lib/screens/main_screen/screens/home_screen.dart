import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';

import '../../../components/text_style.dart';
import '../../../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //search bar
            Container(
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
            )
          ],
        ),
      )
    );
  }
}
