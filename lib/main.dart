import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_watch_store/core/resources/theme.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_watch_store/features/auth/presentation/pages/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/route/routes_map.dart';
import 'config/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // change status bar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: SolidLightColors.scaffoldColor,
      statusBarIconBrightness: Brightness.dark
    )
  );
  injectDi();
  await di.isReady<SharedPreferences>();
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
        BlocProvider<AuthBloc>(create: (_) => di<AuthBloc>())
      ], child:  const SplashPage()),
      routes: watchRoutes,
    );
  }
}
