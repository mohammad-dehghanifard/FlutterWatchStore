import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/storage_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../config/route/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SharedPreferences prefs = di<SharedPreferences>();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      if(prefs.getString(StorageKey.token) == null){
        Navigator.pushReplacementNamed(context,WatchRoutes.sendOtpRoute);
      } else {
        Navigator.pushReplacementNamed(context,WatchRoutes.mainScreenRoute);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:  SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("فروشگاه ساعت",style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white)),
                  12.0.height,
                  const SpinKitPouringHourGlassRefined(
                    size: 64,
                    color: Colors.white,
                  ),
                ],
              ),

              Positioned(
                bottom: 20,
                  child: Text("ورژن 1.0.0",style: Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
