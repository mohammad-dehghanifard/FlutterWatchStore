import 'package:flutter/material.dart';

class WatchMainButton extends StatelessWidget {
  const WatchMainButton({Key? key, required this.title, required this.onTap}) : super(key: key);
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        child: Text(title));
  }
}
