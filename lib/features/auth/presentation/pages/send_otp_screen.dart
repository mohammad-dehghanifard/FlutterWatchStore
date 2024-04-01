import 'package:flutter/material.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/button_style.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/texts.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/features/auth/domain/usecases/send_sms_usecase.dart';

import 'package:flutter_watch_store/gen/assets.gen.dart';


class SendOtpScreen extends StatefulWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  State<SendOtpScreen> createState() => _SendOtpScreenState();
}

class _SendOtpScreenState extends State<SendOtpScreen> {
  final SendSmsUseCase useCase = di();
  @override
  void initState() {
    useCase("09395509227");
    super.initState();
  }
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




