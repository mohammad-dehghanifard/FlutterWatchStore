import 'package:flutter/material.dart';
import 'package:flutter_watch_store/screens/main_screen/widgets/watch_bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // screen
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: size.height * 0.1,
            child: Container(
              width: size.width,
              height: size.height,
              color: Colors.lightGreen,
            ),
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




