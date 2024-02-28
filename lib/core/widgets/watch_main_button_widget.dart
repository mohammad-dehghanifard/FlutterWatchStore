import 'package:flutter/material.dart';

import '../resources/text_style.dart';

class WatchMainButton extends StatelessWidget {
  const WatchMainButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.style,
    this.width = 380,
    this.height = 45,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final double width;
  final double height;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onTap,
          style: style,
          child: Text(title,style: LightTextStyle.mainButtonStyle)),
    );
  }
}
