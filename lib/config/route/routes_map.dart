import 'package:flutter/cupertino.dart';
import 'package:flutter_watch_store/Features/main/presentation/pages/main_screen.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/register_screen.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/send_otp_page.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/features/auth/presentation/pages/check_otp_page.dart';

Map<String,Widget Function(BuildContext context)> watchRoutes = {
  WatchRoutes.checkOtpCode : (context) => const CheckOtpPage(),
  WatchRoutes.sendOtpRoute : (context) => const SendOtpScreen(),
  WatchRoutes.registerRoute : (context) => const RegisterScreen(),
  WatchRoutes.mainScreenRoute : (context) => const MainScreen(),
};