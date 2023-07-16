import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_watch_store/components/button_style.dart';
import 'package:flutter_watch_store/components/extension.dart';
import 'package:flutter_watch_store/resources/dimens.dart';
import 'package:flutter_watch_store/resources/texts.dart';
import 'package:flutter_watch_store/route/route_names.dart';
import 'package:flutter_watch_store/widgets/watch_app_bar.dart';
import 'package:flutter_watch_store/widgets/watch_avatar_widget.dart';
import 'package:flutter_watch_store/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/widgets/watch_text_field.dart';
import '../gen/assets.gen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: WatchAppBar(
          title: WatchTexts.registerTxt,
          icon: SvgPicture.asset(Assets.svg.leftArrow),
          size: size,
          onIconTap: () {}),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // user avatar
              WatchAvatar(onTextPress: () {}),

              Dimens.small.height,
              // input first and last name
              WatchTextField(controller: controller,
                hintTxt: WatchTexts.inputFirstAndLastNameHint,
                lableTxt: WatchTexts.inputFirstAndLastNameLable,
                textAlign: TextAlign.start
              ),

              // input phone number
              WatchTextField(controller: controller,
                hintTxt: WatchTexts.inputPhoneNumberHint,
                lableTxt: WatchTexts.inputPhoneNumberLable,
                textAlign: TextAlign.start
              ),

              // input address
              WatchTextField(controller: controller,
                  hintTxt: WatchTexts.inputAddressHint,
                  lableTxt: WatchTexts.inputAddressLable,
                  textAlign: TextAlign.start
              ),

              // input postal code
              WatchTextField(controller: controller,
                  hintTxt: WatchTexts.inputPostalCodeHint,
                  lableTxt: WatchTexts.inputPostalCodeLable,
                  textAlign: TextAlign.start
              ),

              // input location
              WatchTextField(controller: controller,
                  hintTxt: WatchTexts.inputSelectLocationHint,
                  lableTxt: WatchTexts.inputSelectLocationLable,
                  textAlign: TextAlign.start
              ),

              Padding(
                padding:  EdgeInsets.all(Dimens.small),
                child: WatchMainButton(
                  title: WatchTexts.registerTxt,
                  onTap: () => Navigator.pushReplacementNamed(context, WatchRoutes.mainScreenRoute),
                  width: double.infinity,
                  height: size.height / 18,
                  style: WatchButtonStyle.mainButtonStyle,
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}

