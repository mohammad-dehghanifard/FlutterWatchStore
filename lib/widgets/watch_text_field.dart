import 'package:flutter/material.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/resources/dimens.dart';

class WatchTextField extends StatelessWidget {
  const WatchTextField({Key? key,
    required this.lableTxt,
    required this.hintTxt,
    required this.controller,
    this.icon = const SizedBox(),
    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.center
  }) : super(key: key);

  final String lableTxt;
  final String hintTxt;
  final TextEditingController controller;
  final Widget icon;
  final TextInputType inputType;
  final TextAlign textAlign;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(Dimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(lableTxt),
          Dimens.medium.height,
           TextField(
            controller: controller,
             textAlign: textAlign,
             keyboardType: inputType,
             decoration: InputDecoration(
               hintText: hintTxt,
               prefix: icon
             ),

          )
        ],
      ),
    );
  }
}