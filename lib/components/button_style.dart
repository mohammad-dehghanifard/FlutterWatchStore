import 'package:flutter/material.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/resources/dimens.dart';

class WatchButtonStyle{
  WatchButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.medium))),
    backgroundColor: const MaterialStatePropertyAll(SolidLightColors.primary)
  );
}