import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchTheme{
  WatchTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: "dana",
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFB93160),
        secondary: Color(0xFFF6F8FE),
        primaryContainer: Color(0xFF9CA4AB),
        secondaryContainer: Color(0xFFEEEEEE),
        error: Color(0xFFE53935),
      ),
      dialogTheme: const DialogTheme(
        backgroundColor: Color(0xFFF6F8FE),
        surfaceTintColor: Color(0xFFF6F8FE),
      ),
      textTheme:  const TextTheme(
          titleLarge: TextStyle(color: Color(0xFF282837),fontWeight: FontWeight.bold,fontSize: 24),
          displaySmall: TextStyle(color: Color(0xFF282837),fontWeight: FontWeight.w300,fontSize: 12),
          bodySmall: TextStyle(color: Color(0xFF9CA4AB),fontWeight: FontWeight.w500,fontSize: 12),
          titleMedium: TextStyle(color: Color(0xFF282837),fontWeight: FontWeight.bold,fontSize: 16),
      )
    );
  }
}