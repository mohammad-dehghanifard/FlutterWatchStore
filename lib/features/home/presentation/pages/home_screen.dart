import 'package:flutter/material.dart';
import 'package:flutter_watch_store/Features/home/presentation/widgets/home_slider.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // search
            const Padding(
              padding: EdgeInsets.all(Dimens.bodyMargin),
              child: WatchTextField(
                hintText: "کالای مورد نظر خود را جست و جو کنید...",
                icon: Icons.search,
              ),
            ),
            // slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:Dimens.bodyMargin),
              child: HomeSlider(),
            ),
            // categories
            ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
            )
          ],
        )
      )
    );
  }
}







