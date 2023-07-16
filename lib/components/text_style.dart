import 'package:flutter/rendering.dart';
import 'package:flutter_watch_store/gen/fonts.gen.dart';
import 'package:flutter_watch_store/resources/colors.dart';

class LightTextStyle{
  static TextStyle formLabelStyle = const TextStyle(fontFamily: FontFamily.dana,fontSize: 16,color: SolidLightColors.title,fontWeight: FontWeight.w500);
  static TextStyle formHintStyle = const TextStyle(fontFamily: FontFamily.dana,fontSize: 14,color: SolidLightColors.hint,fontWeight: FontWeight.w400);

  static TextStyle textButtonStyle = const TextStyle(fontFamily: FontFamily.dana,fontSize: 14,color: SolidLightColors.title,fontWeight: FontWeight.w400);
  static TextStyle mainButtonStyle = const TextStyle(fontFamily: FontFamily.dana,fontSize: 18,color: SolidLightColors.buttonText,fontWeight: FontWeight.w500);

  static TextStyle normalBodyStyle = const TextStyle(fontFamily: FontFamily.dana,fontSize: 14,color: SolidLightColors.title,fontWeight: FontWeight.w400);

  static TextStyle activeBottomNav = const TextStyle(fontFamily: FontFamily.dana,fontSize: 12,color: SolidLightColors.activeBtnNav,fontWeight: FontWeight.w700);
  static TextStyle deactivateBottomNav = const TextStyle(fontFamily: FontFamily.dana,fontSize: 12,color: SolidLightColors.deactivateBtnNav,fontWeight: FontWeight.w700);
}