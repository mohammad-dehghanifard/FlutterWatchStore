import 'package:flutter/material.dart';

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
          Positioned(
            bottom: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.1,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}
