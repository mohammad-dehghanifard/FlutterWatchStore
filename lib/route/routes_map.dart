import 'package:flutter/cupertino.dart';
import 'package:flutter_watch_store/route/route_names.dart';
import 'package:flutter_watch_store/screens/get_opt_screen.dart';
import 'package:flutter_watch_store/screens/main_screen/screens/main_screen.dart';
import 'package:flutter_watch_store/screens/register_screen.dart';
import 'package:flutter_watch_store/screens/send_otp_screen.dart';

Map<String,Widget Function(BuildContext context)> watchRoutes = {
  WatchRoutes.getOtpRoute : (context) => const GetOtpScreen(),
  WatchRoutes.sendOtpRoute : (context) => const SendOtpScreen(),
  WatchRoutes.registerRoute : (context) => const RegisterScreen(),
  WatchRoutes.mainScreenRoute : (context) => const MainScreen(),
};