import 'package:flutter/cupertino.dart';

class RegisterForms {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameTxt = TextEditingController();
  final TextEditingController addressTxt = TextEditingController();
  final TextEditingController postalCodeTxt = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "لطفا یک نام وارد کنید";
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "لطفا آدرس وارد کنید";
    } else if(value.length < 4) {
      return "آدرس وارد شده بسیار کوتاه است";
    }
    return null;
  }

  String? validatePostalCode(String? value) {
    if (value == null || value.isEmpty) {
      return "لطفا شماره تماس معتبر وارد کنید";
    } else if(value.length < 10) {
      return "کدپستی وارد شده صحیح نمیباشد";
    }
    return null;
  }
}
