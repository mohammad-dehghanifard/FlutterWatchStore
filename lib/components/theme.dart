import 'package:flutter/material.dart';
import 'package:flutter_watch_store/resources/colors.dart';

import '../resources/dimens.dart';

class WatchTheme{
  WatchTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: SolidLightColors.scaffoldColor,
      primaryColor: SolidLightColors.primary,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states){
          if(states.contains(MaterialState.focused)){
            return SolidLightColors.focusedBorderColor;
          }else{
            return SolidLightColors.unfocusedBorderColor;
          }
        } ),
        contentPadding: EdgeInsets.all(Dimens.medium),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.medium),
            borderSide: const BorderSide(color: SolidLightColors.primary)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.medium),
          borderSide: const BorderSide(color: SolidLightColors.borderColor)
        )
      )
    );
  }
}