import 'package:flutter/material.dart';

class WatchTextField extends StatelessWidget {
  const WatchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("لطفا نام شماره تلفن خود را وارد کنید")
      ],
    );
  }
}