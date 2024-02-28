import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/button_style.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/text_style.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';

import '../resources/texts.dart';


class WatchAvatar extends StatelessWidget {
  const WatchAvatar({Key? key, required this.onTextPress}) : super(key: key);

  final Function() onTextPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image.asset(Assets.png.avatar.path),
        ),

        Dimens.small.height,

        TextButton(
            onPressed: onTextPress,
            style: WatchButtonStyle.textButtonStyle,
            child: Text(WatchTexts.selectUserProfile,style: LightTextStyle.textButtonStyle))
      ],
    );
  }
}
