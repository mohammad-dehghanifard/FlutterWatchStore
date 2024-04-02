import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_watch_store/Features/auth/presentation/pages/send_otp_page.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/core/resources/theme.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'config/route/routes_map.dart';
import 'config/services/service_locator.dart';

void main() {
  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: SolidLightColors.scaffoldColor,
      statusBarIconBrightness: Brightness.dark
    )
  );
  injectDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      home: MultiBlocProvider(providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(sendSmsUseCase: di()))
      ], child:  SendOtpScreen()),
      routes: watchRoutes,
    );
  }
}
