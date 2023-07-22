import 'package:flutter/material.dart';
import 'package:flutter_watch_store/components/button_style.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/route/route_names.dart';
import 'package:flutter_watch_store/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/widgets/watch_text_field.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

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

            Dimens.large.height,
            // Text Field
            WatchTextField(controller: controller,hintTxt: WatchTexts.inputNumberHint,lableTxt: WatchTexts.inputNumberLable),

            Dimens.medium.height,

            Padding(
              padding:  EdgeInsets.all(Dimens.small),
              child: WatchMainButton(
                title: WatchTexts.continuationTxt,
                onTap: () {
                  Navigator.pushReplacementNamed(context, WatchRoutes.getOtpRoute);
                },
                width: double.infinity,
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




