import 'package:flutter/material.dart';
import 'package:flutter_watch_store/core/widgets/watch_app_bar.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';



class CheckOtpPage extends StatelessWidget {
  const CheckOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      appBar: const WatchAppBar(title: "تایید کد"),
      body: Padding(
        padding:  const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.06),
            Text("کد تایید با موفقیت ارسال شد",style: textTheme.titleLarge),
            SizedBox(height: size.height * 0.06),
            Image.asset("assets/png/sendotp.png",scale: 2),
            SizedBox(height: size.height * 0.03),
            // message
            Text(
                "یک کد تایید چهار رقمی به شماره موبایل شما ارسال شد، پس از وارد کردن و تایید کد میتوانید ثبت نام خود را تکمیل کنید",
                textAlign: TextAlign.center,
                style: textTheme.displaySmall),
            SizedBox(height: size.height * 0.06),
            // otp text field
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 60,
              otpFieldStyle: OtpFieldStyle(
                focusBorderColor: Theme.of(context).colorScheme.primary,
                enabledBorderColor: Theme.of(context).colorScheme.primaryContainer
              ),
              style: textTheme.titleMedium!,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldStyle: FieldStyle.box,
              onChanged: (value) {},
              onCompleted: (pin) {},
            ),
            SizedBox(height: size.height * 0.12),
            WatchMainButton(title: "تایید کد و ثبت نام", onTap: () {}),
          ],
        ),
      ),
    );
  }
}