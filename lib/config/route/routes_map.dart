import 'package:flutter/cupertino.dart';
import 'package:flutter_watch_store/Features/main/presentation/pages/main_screen.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/register_page.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/send_otp_page.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/features/auth/presentation/pages/check_otp_page.dart';
import 'package:flutter_watch_store/features/product/presentation/pages/product_detail_page.dart';

Map<String,Widget Function(BuildContext context)> watchRoutes = {
  WatchRoutes.checkOtpCode : (context) =>  CheckOtpPage(),
  WatchRoutes.sendOtpRoute : (context) =>  SendOtpScreen(),
  WatchRoutes.registerRoute : (context) =>  RegisterScreen(),
  WatchRoutes.mainScreenRoute : (context) => const MainScreen(),
  WatchRoutes.productDetail : (context) => const ProductDetailPage(),
};