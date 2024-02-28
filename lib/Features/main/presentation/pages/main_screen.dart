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

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late Map<int,GlobalKey<NavigatorState>> keyMap = {
    BottomNavIndex.homeIndex : _homeKey,
    BottomNavIndex.basketIndex : _basketKey,
    BottomNavIndex.profileIndex : _profileKey,
  };
  final List<int> _routeHistory = [BottomNavIndex.homeIndex];

  Future<bool> _willPop() async{
    if(keyMap[selectedIndex]!.currentState!.canPop()){
      keyMap[selectedIndex]!.currentState!.pop();
    } else if(_routeHistory.length > 1){
      setState(() {
        _routeHistory.removeLast();
        selectedIndex = _routeHistory.last;
      });
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: WillPopScope(
        onWillPop: _willPop,
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
                children: [
                  // home screen
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) =>  const HomeScreen()),
                  ),

                  // basket screen
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const CartScreen()),
                  ),

                  // profile screen
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  ),

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
                    _routeHistory.add(newIndex);
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




