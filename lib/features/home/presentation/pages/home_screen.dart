import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_watch_store/Features/home/presentation/widgets/home_slider.dart';
import 'package:flutter_watch_store/config/services/service_locator.dart';
import 'package:flutter_watch_store/core/resources/dimens.dart';
import 'package:flutter_watch_store/core/resources/extension.dart';
import 'package:flutter_watch_store/core/widgets/show_snack_bar.dart';
import 'package:flutter_watch_store/core/widgets/watch_text_field.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entity.dart';
import 'package:flutter_watch_store/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_watch_store/features/home/presentation/bloc/home_status.dart';
import 'package:flutter_watch_store/features/home/presentation/widgets/home_category_list_item_widget.dart';
import 'package:flutter_watch_store/features/home/presentation/widgets/home_product_section_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: BlocProvider<HomeBloc>(
              create: (context) => di<HomeBloc>()..add(FetchHomeDataEvent()),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {
                  if(state is HomeError) {
                    final currentState = state.homeStatus as HomeError;
                    ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(context: context, content: currentState.errorMessage));
                  }
                },
                builder: (context, state) {
                  // show loading
                  if(state.homeStatus is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // load data
                  else if(state.homeStatus is HomeSuccess){
                    final currentState = state.homeStatus as HomeSuccess;
                    final HomeEntity entity =  currentState.homeData;
                    return SingleChildScrollView(
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
                            padding:
                            const EdgeInsets.symmetric(horizontal: Dimens.bodyMargin),
                            child: HomeSlider(sliders: entity.data!.sliders!),
                          ),
                          6.0.height,
                          // categories
                          HomeCategoryListItemWidget(categories: entity.data!.categories!),
                          // amazing products list
                          HomeProductSection(products: entity.data!.amazingProducts!),
                          16.0.height,
                          // banner
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: Dimens.bodyMargin),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network("https://watchstore.sasansafari.com/public/images/sliders/big/${entity.data!.banner!.image!}")),
                          ),
                          16.0.height,
                          // popular products list
                          HomeProductSection(products: entity.data!.mostSellerProducts!),
                          16.0.height,
                          // new products list
                          HomeProductSection(products: entity.data!.newestProducts!),
                      
                          SizedBox(height: MediaQuery.sizeOf(context).height / 8)
                        ],
                      ),
                    );
                  } else {
                    throw Exception("state invalidate...");
                  }
                },
              ),
            )));
  }
}
