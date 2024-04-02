import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/widgets/watch_app_bar.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_watch_store/features/auth/presentation/bloc/auth_status.dart';
import 'package:flutter_watch_store/features/auth/presentation/widgets/otp_fields_widget.dart';

class CheckOtpPage extends StatelessWidget {
  const CheckOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String? code;
    print(args['code']);

    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => di<AuthBloc>(),
      child: Scaffold(
        appBar: const WatchAppBar(title: "تایید کد"),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.06),
                    Text("کد تایید با موفقیت ارسال شد",
                        style: textTheme.titleLarge),
                    SizedBox(height: size.height * 0.06),
                    Image.asset("assets/png/sendotp.png", scale: 2),
                    SizedBox(height: size.height * 0.03),
                    // message
                    Text(
                        "یک کد تایید چهار رقمی به شماره موبایل شما ارسال شد، پس از وارد کردن و تایید کد میتوانید ثبت نام خود را تکمیل کنید",
                        textAlign: TextAlign.center,
                        style: textTheme.displaySmall),
                    SizedBox(height: size.height * 0.06),
                    // otp text field
                    OtpFieldsWidget(
                      onCompleted: (pin) {code = pin;},
                    ),
                    SizedBox(height: size.height * 0.12),
                    BlocConsumer<AuthBloc, AuthState>(
                      buildWhen: (previous, current) {
                        if(previous.authStatus == current.authStatus) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                         if(state.authStatus is AuthInitial || state.authStatus is AuthCheckSmsSuccess) {
                           return WatchMainButton(
                               title: "تایید کد و ثبت نام", onTap: () {
                                 di<AuthBloc>().add(CheckSmsEvent(phoneNumber: args["mobile"], code: code!));
                           });
                         } else if(state.authStatus is AuthLoading) {
                           return const CircularProgressIndicator();
                         } else {
                           throw Exception("state invalidate...");
                         }
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
