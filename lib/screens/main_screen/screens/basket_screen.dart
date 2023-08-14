import 'package:flutter/material.dart';
import 'package:flutter_watch_store/screens/single_producte_screen.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        color: Colors.orange,
          child: const Text("مشاهده همه"),),
    );
  }
}
