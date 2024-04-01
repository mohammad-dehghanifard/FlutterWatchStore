import 'package:flutter/material.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/core/resources/button_style.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/text_style.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/texts.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';


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
                onTap: () {
                  Navigator.pushReplacementNamed(context, WatchRoutes.registerRoute);
                },
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
