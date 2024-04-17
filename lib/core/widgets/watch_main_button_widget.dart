import 'package:flutter/material.dart';

class WatchMainButton extends StatelessWidget {
  const WatchMainButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height = 50,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
            minimumSize: MaterialStatePropertyAll(Size(width,height)),
          ),
          child: Text(title,style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.white))),
    );
  }
}
