import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';

class SelectLocationMapButton extends StatelessWidget {
  const SelectLocationMapButton({
    super.key,
    required this.onTap,
  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.secondary
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.map),
            8.0.width,
            Text("انتخاب موقعیت مکانی از روی نقشه",style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}