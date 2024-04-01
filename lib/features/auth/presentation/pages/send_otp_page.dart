import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_watch_store/config/route/route_names.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/gen/assets.gen.dart';



class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            Text("به واچ استور خوش آمدید",style: textTheme.titleLarge!.apply(color: Colors.white)),
            SizedBox(height: size.height * 0.01),
            Text("فروشگاهی برای شیک پوشان",style: textTheme.displaySmall!.apply(color: Colors.white)),
            Expanded(
                child: Container(
                  width: size.width,
                  height: size.height,
                  padding:  EdgeInsets.symmetric(horizontal: 25,vertical: size.height / 12),
                  margin: EdgeInsets.only(top: size.height * 0.06),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * 0.12),
                      topRight: Radius.circular(size.width * 0.12)
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // logo
                        Image.asset(Assets.png.mainLogo.path,scale: 1.5),
                        SizedBox(height: size.height * 0.06),
                        // text field
                         const WatchTextField(
                          inputType: TextInputType.phone,
                          icon: CupertinoIcons.device_phone_portrait,
                          hintText: "لطفا شماره موبایل خود را وارد کنید",
                        ),
                        SizedBox(height: size.height * 0.12),
                        // button
                        WatchMainButton(
                            onTap: () => Navigator.pushNamed(context, WatchRoutes.checkOtpCode),
                            title: "ارسال کد تایید")
                      ],
                    ),
                  ),
                )
            )
          ],
        ),
      )
    );
  }
}




