import 'package:flutter/cupertino.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/get_opt_screen.dart';
import 'package:flutter_watch_store/Features/main/presentation/pages/main_screen.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/register_screen.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/send_otp_page.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';

Map<String,Widget Function(BuildContext context)> watchRoutes = {
  WatchRoutes.getOtpRoute : (context) => const GetOtpScreen(),
  WatchRoutes.sendOtpRoute : (context) => const SendOtpScreen(),
  WatchRoutes.registerRoute : (context) => const RegisterScreen(),
  WatchRoutes.mainScreenRoute : (context) => const MainScreen(),
};