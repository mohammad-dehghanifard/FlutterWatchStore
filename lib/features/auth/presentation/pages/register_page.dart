import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/resources/storage_key.dart';
import 'package:flutter_watch_store/core/widgets/watch_main_button_widget.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/features/auth/presentation/widgets/map_dialog.dart';
import 'package:flutter_watch_store/features/auth/presentation/widgets/select_location_map_button.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Image.asset("assets/png/main_logo.png",scale: 1.6),
                  8.0.height,
                  Text("تکمیل ثبت نام",style: textTheme.titleMedium),
                  6.0.height,
                  Text("لطفا جهت تکمیل ثبت نام فرم زیر را تکمیل کنید",style: textTheme.bodySmall),
                  32.0.height,
                  const WatchTextField(
                    hintText: "لطفا نام خود را وار کنید",
                    icon: CupertinoIcons.person,
                  ),
                 12.0.height,
                  const WatchTextField(
                    hintText: "لطفا آدرس خود را وار کنید",
                    icon: CupertinoIcons.home,
                  ),

                  12.0.height,
                  const WatchTextField(
                    hintText: "لطفا یک کد پستی معتبر وارد کنید",
                    icon: Icons.local_post_office_outlined,
                  ),
                  12.0.height,
                  // get location in map
                  SelectLocationMapButton(onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => MapDialog(
                        onSelect: (latitude, longitude) {

                        },
                      ),
                    );
                  }),
                  24.0.height,
                  // register button
                  WatchMainButton(title: "ثبت نام", onTap: () {},)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



