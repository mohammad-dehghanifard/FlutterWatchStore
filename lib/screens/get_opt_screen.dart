import 'package:flutter/material.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/components/text_style.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/widgets/watch_main_button_widget.dart';

import '../components/button_style.dart';
import '../widgets/watch_text_field.dart';

class GetOtpScreen extends StatelessWidget {
  const GetOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController controller = TextEditingController();
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(Assets.png.mainLogo.path,width: Dimens.large * 10),

            Dimens.medium.height,

            Text(WatchTexts.otpSendForTxt.replaceAll(WatchTexts.replaceNumberTxt,"09395509227"),style: LightTextStyle.normalBodyStyle),
            Dimens.small.height,
            Text(WatchTexts.wrongOtpNumberTxt,style: LightTextStyle.normalBodyStyle),

            Dimens.medium.height,
            // Text Field
            SizedBox(
              width: size.width / 1.2,
                child: WatchTextField(controller: controller,hintTxt: WatchTexts.inputNumberHint,lableTxt: WatchTexts.inputActiveCode,prefixLableTxt: "2:56",)),

            Dimens.medium.height,

            Padding(
              padding:  EdgeInsets.all(Dimens.small),
              child: WatchMainButton(
                title: WatchTexts.continuationTxt,
                onTap: () {},
                width: size.width / 1.3,
                height: size.height / 18,
                style: WatchButtonStyle.mainButtonStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
