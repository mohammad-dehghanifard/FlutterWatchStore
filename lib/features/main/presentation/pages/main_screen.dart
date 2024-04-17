import 'package:flutter/material.dart';
import 'package:flutter_watch_store/Features/cart/presentation/pages/cart_screen.dart';
import 'package:flutter_watch_store/Features/user/presentation/pages/profile_screen.dart';
import 'package:flutter_watch_store/core/resources/bottom_nav_index.dart';
import 'package:flutter_watch_store/Features/home/presentation/pages/home_screen.dart';
import 'package:flutter_watch_store/Features/main/presentation/widgets/watch_bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BottomNavIndex.homeIndex;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // screens
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: size.height * 0.01,
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  // home screen
                  HomeScreen(),
        
                  // basket screen
                 CartScreen(),
        
                  // profile screen
                  ProfileScreen(),
        
        
                ],
              ),
            ),
            // bottom navigation
            Positioned(
              bottom: 0,
              child: WatchBottomNav(
                index: selectedIndex,
                onTap: (newIndex) {
                  setState(() {
                    selectedIndex = newIndex;
                  });
                },
              ),
            ),
        
          ],
        ),
      )
    );
  }
}




