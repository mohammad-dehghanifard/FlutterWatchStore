import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchButtonStyle{
  WatchButtonStyle._();

  // elevated button style
  static ButtonStyle mainButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.medium))),
    backgroundColor: const MaterialStatePropertyAll(SolidLightColors.primary)
  );

  // text button style
  static ButtonStyle textButtonStyle = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.small))),
      overlayColor: MaterialStatePropertyAll(SolidLightColors.primary.withOpacity(0.3))
  );
}
