import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpFieldsWidget extends StatelessWidget {
  const OtpFieldsWidget({super.key, this.onCompleted});
  final Function(String pin)? onCompleted;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return OTPTextField(
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
      onCompleted: onCompleted,
    );
  }
}
