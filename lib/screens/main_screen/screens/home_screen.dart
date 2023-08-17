import 'package:flutter/material.dart';
import '../../../widgets/home_search_bar.dart';
import '../../../widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //search bar
            HomeSearchBar(size: size),
            // slider
            HomeSlider()
          ],
        ),
      )
    );
  }
}





