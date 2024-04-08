import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/storage_key.dart';
import 'package:flutter_watch_store/core/widgets/show_snack_bar.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_status.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendOtpScreen extends StatelessWidget {
  SendOtpScreen({Key? key}) : super(key: key);
  final TextEditingController phoneNumberTxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.06),
              Text("به واچ استور خوش آمدید",
                  style: textTheme.titleLarge!.apply(color: Colors.white)),
              SizedBox(height: size.height * 0.01),
              Text("فروشگاهی برای شیک پوشان",
                  style: textTheme.displaySmall!.apply(color: Colors.white)),
              // text field and button
              Expanded(
                  child: Container(
                    width: size.width,
                    height: size.height,
                    padding: EdgeInsets.symmetric(
                        horizontal: 25, vertical: size.height / 12),
                    margin: EdgeInsets.only(top: size.height * 0.06),
                    decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(size.width * 0.12),
                            topRight: Radius.circular(size.width * 0.12))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // logo
                          Image.asset(Assets.png.mainLogo.path, scale: 1.5),
                          SizedBox(height: size.height * 0.06),
                          // text field
                          WatchTextField(
                            controller: phoneNumberTxt,
                            inputType: TextInputType.phone,
                            icon: CupertinoIcons.device_phone_portrait,
                            hintText: "لطفا شماره موبایل خود را وارد کنید",
                          ),
                          SizedBox(height: size.height * 0.12),
                          // button

                          BlocConsumer<AuthBloc, AuthState>(
                            buildWhen: (previous, current) {
                              if(previous.authStatus == current.authStatus) {
                                return false;
                              }
                              return true;
                            },
                            listener: (context, state) {
                              if (state.authStatus is AuthError) {
                                final currentState = state
                                    .authStatus as AuthError;
                                ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
                                    context: context,
                                    type: SnackType.error,
                                    content: currentState.errorMessage));
                              }
                              // goto check otp page
                              if(state.authStatus is AuthSendSmsSuccess) {
                                final currentState = state.authStatus as AuthSendSmsSuccess;
                                _savePhone(phoneNumberTxt.text);
                                Navigator.pushNamed(context, WatchRoutes.checkOtpCode,arguments: {
                                  "mobile" : phoneNumberTxt.text,
                                  "code" : currentState.code
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state.authStatus is AuthInitial || state.authStatus is AuthSendSmsSuccess) {
                                return Visibility(
                                  visible: true,
                                  child: WatchMainButton(
                                      onTap: () {
                                        BlocProvider.of<AuthBloc>(context).add(
                                            SendSmsEvent(
                                                phoneNumber: phoneNumberTxt
                                                    .text));
                                      },
                                      title: "ارسال کد تایید"),
                                );
                              } else if (state.authStatus is AuthLoading) {
                                return const CircularProgressIndicator();
                              } else {
                                throw Exception("state invalidate...");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}
_savePhone(String phone) async => await di<SharedPreferences>().setString(StorageKey.userPhone, phone);