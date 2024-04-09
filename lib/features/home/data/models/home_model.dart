import 'package:flutter_watch_store/features/home/data/models/banner_model.dart';
import 'package:flutter_watch_store/features/home/data/models/category_model.dart';
import 'package:flutter_watch_store/features/home/data/models/slider_model.dart';
import 'package:flutter_watch_store/features/home/data/models/watch_product_model.dart';
import 'package:flutter_watch_store/features/home/domain/entities/home_entitie.dart';


class HomeModel extends HomeEntity{

  HomeModel({
    bool? result,
    String? message,
    HomeData? data,
  }) : super(result: result, message: message, data: data);

 factory HomeModel.fromJson(Map<String, dynamic> json) {
   return HomeModel(
     result: json['result'],
     message: json['message'],
     data:  json['data'] != null ? HomeData.fromJson(json['data']) : null
   );
  }
}

class HomeData {
  List<SliderModel>? sliders;
  List<CategoryModel>? categories;
  List<WatchProduct>? amazingProducts;
  Banner? banner;
  List<WatchProduct>? mostSellerProducts;
  List<WatchProduct>? newestProducts;

  HomeData({
    this.sliders,
    this.categories,
    this.amazingProducts,
    this.banner,
    this.mostSellerProducts,
    this.newestProducts,
  });

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderModel>[];
      json['sliders'].forEach((v) {
        sliders!.add(SliderModel.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
    if (json['amazing_products'] != null) {
      amazingProducts = <WatchProduct>[];
      json['amazing_products'].forEach((v) {
        amazingProducts!.add(WatchProduct.fromJson(v));
      });
    }
    banner = json['banner'] != null ? Banner.fromJson(json['banner']) : null;
    if (json['most_seller_products'] != null) {
      mostSellerProducts = <WatchProduct>[];
      json['most_seller_products'].forEach((v) {
        mostSellerProducts!.add(WatchProduct.fromJson(v));
      });
    }
    if (json['newest_products'] != null) {
      newestProducts = <WatchProduct>[];
      json['newest_products'].forEach((v) {
        newestProducts!.add(WatchProduct.fromJson(v));
      });
    }
  }
}









