import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_watch_store/components/theme.dart';
import 'package:flutter_watch_store/resources/colors.dart';
import 'package:flutter_watch_store/screens/get_opt_screen.dart';
import 'package:flutter_watch_store/screens/register_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_watch_store/screens/send_otp_screen.dart';

void main() {
  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: SolidLightColors.scaffoldColor)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Store',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      locale: const Locale('fa'),
      theme: WatchTheme.lightTheme(),
      home: const SendOtpScreen(),
    );
  }
}
