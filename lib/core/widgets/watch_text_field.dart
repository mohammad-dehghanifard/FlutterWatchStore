import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/text_style.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';


class WatchTextField extends StatelessWidget {
  const WatchTextField({Key? key,
    required this.lableTxt,
    required this.hintTxt,
    required this.controller,
    this.icon = const SizedBox(),
    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.center,
    this.prefixLableTxt = '',
  }) : super(key: key);

  final String lableTxt;
  final String prefixLableTxt;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(lableTxt,style: LightTextStyle.formLabelStyle),
              Text(prefixLableTxt,style: LightTextStyle.formLabelStyle)
            ],
          ),
          Dimens.medium.height,
           TextField(
            controller: controller,
             textAlign: textAlign,
             keyboardType: inputType,
             decoration: InputDecoration(
               hintStyle: LightTextStyle.formHintStyle,
               hintText: hintTxt,
               prefix: icon
             ),

          )
        ],
      ),
    );
  }
}