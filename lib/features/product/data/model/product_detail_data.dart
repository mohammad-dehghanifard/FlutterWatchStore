import 'package:flutter_watch_store/features/product/data/model/product_color.dart';
import 'package:flutter_watch_store/features/product/data/model/product_comments.dart';
import 'package:flutter_watch_store/features/product/data/model/product_properties.dart';

class ProductDetailData {
  int? id;
  String? title;
  String? titleEn;
  int? price;
  int? discount;
  int? discountPrice;
  String? guaranty;
  int? productCount;
  String? category;
  int? categoryId;
  List<ProductColor>? colors;
  String? brand;
  int? brandId;
  int? review;
  String? image;
  List<Properties>? properties;
  String? description;
  String? discussion;
  List<ProductComment>? comments;

  ProductDetailData(
      {this.id,
        this.title,
        this.titleEn,
        this.price,
        this.discount,
        this.discountPrice,
        this.guaranty,
        this.productCount,
        this.category,
        this.categoryId,
        this.colors,
        this.brand,
        this.brandId,
        this.review,
        this.image,
        this.properties,
        this.description,
        this.discussion,
        this.comments});

  ProductDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleEn = json['title_en'];
    price = json['price'];
    discount = json['discount'];
    discountPrice = json['discount_price'];
    guaranty = json['guaranty'];
    productCount = json['product_count'];
    category = json['category'];
    categoryId = json['category_id'];
    if (json['colors'] != null) {
      colors = <ProductColor>[];
      json['colors'].forEach((v) {
        colors!.add(ProductColor.fromJson(v));
      });
    }
    brand = json['brand'];
    brandId = json['brand_id'];
    review = json['review'];
    image = json['image'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(Properties.fromJson(v));
      });
    }
    description = json['description'];
    discussion = json['discussion'];
    if (json['comments'] != null) {
      comments = <ProductComment>[];
      json['comments'].forEach((v) {
        comments!.add(ProductComment.fromJson(v));
      });
    }
  }


}
