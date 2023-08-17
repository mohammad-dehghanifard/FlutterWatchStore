import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/resources/dimens.dart';

import '../components/text_style.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.title, required this.imgPath, required this.gradiant,
  });

  final String title;
  final String imgPath;
  final List<Color> gradiant;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        //images
        Container(
          width: size.width / 5.5,
          height: size.width / 5.5,
          margin: EdgeInsets.only(
              right: Dimens.medium + 2,
              left: Dimens.medium + 2
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.medium + 6),
              gradient: LinearGradient(
                  colors: gradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(imgPath,height: 48),
            ],
          ),
        ),
        Dimens.small.height,
        //title
        Text(title,style: LightTextStyle.normalBodyStyle)
      ],
    );
  }
}