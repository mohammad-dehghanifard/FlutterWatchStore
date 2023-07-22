import 'package:flutter/material.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(child: Text('صفحه جزئیات محصول',style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}