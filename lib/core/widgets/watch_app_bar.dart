import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/text_style.dart';
import 'package:flutter_watch_store/core/resources/colors.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchAppBar extends StatelessWidget implements PreferredSizeWidget  {
  const WatchAppBar({
    super.key,
    required this.title,
  });

  final String title;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PreferredSize(
        preferredSize: Size(size.width, size.height * 0.06),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal :Dimens.medium,vertical: Dimens.small),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: Theme.of(context).textTheme.titleMedium),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.20),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);


}