import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchTheme{
  WatchTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: "dana",
      scaffoldBackgroundColor: SolidLightColors.scaffoldColor,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFB93160),
        secondary: Color(0xFFF6F8FE),
        primaryContainer: Color(0xFF9CA4AB),
        error: Color(0xFFE53935),

      ),
      textTheme: TextTheme(

      )
    );
  }
}