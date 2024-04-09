import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_watch_store/Features/home/presentation/widgets/home_slider.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/features/home/presentation/widgets/home_category_list_item_widget.dart';
import 'package:flutter_watch_store/features/home/presentation/widgets/home_product_section_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              6.0.height,
              // categories
              const HomeCategoryListItemWidget(),
              // amazing products list
              const HomeProductSection(),
              16.0.height,
              // banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.bodyMargin),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                    child: Image.network("https://watchstore.sasansafari.com/public/images/sliders/big/1652882081.jpg")),
              ),
              16.0.height,
              // popular products list
              const HomeProductSection(),
              16.0.height,
              // new products list
              const HomeProductSection(),

              SizedBox(height: MediaQuery.sizeOf(context).height / 8)
            ],
          ),
        )
      )
    );
  }
}









