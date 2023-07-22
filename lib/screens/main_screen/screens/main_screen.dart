import 'package:flutter/material.dart';
import 'package:flutter_watch_store/screens/main_screen/screens/basket_screen.dart';
import 'package:flutter_watch_store/screens/main_screen/screens/home_screen.dart';
import 'package:flutter_watch_store/screens/main_screen/screens/profile_screen.dart';
import 'package:flutter_watch_store/screens/main_screen/widgets/watch_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: 0,
            children: [
              // home screen
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: size.height * 0.1,
                child: const HomeScreen(),
              ),

              // basket screen
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: size.height * 0.1,
                child: const BasketScreen(),
              ),

              // profile screen
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: size.height * 0.1,
                child: const ProfileScreen(),
              ),


            ],
          ),
          // bottom navigation
          const Positioned(
            bottom: 0,
            child: WatchBottomNav(),
          ),

        ],
      ),
    );
  }
}




