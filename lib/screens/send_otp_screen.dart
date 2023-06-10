import 'package:flutter/material.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/widgets/watch_text_field.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return  Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Image.asset(Assets.png.mainLogo.path,width: Dimens.large * 10),

            Dimens.medium.height,

             WatchTextField(controller: controller,hintTxt: AppTexts.inputNumberHint,lableTxt: AppTexts.inputNumberLable)
          ],
        ),
      ),
    );
  }
}




