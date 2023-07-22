import 'package:flutter/material.dart';
import 'package:flutter_watch_store/screens/prodocte_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProductListScreen(),)),
        child: const Text("مشاهده همه"),
      ),),
    );
  }
}
