class WatchProduct {
  int? id;
  String? title;
  int? price;
  int? discount;
  String? specialExpiration;
  int? discountPrice;
  int? productCount;
  String? category;
  String? brand;
  String? image;

  WatchProduct({
    this.id,
    this.title,
    this.price,
    this.discount,
    this.specialExpiration,
    this.discountPrice,
    this.productCount,
    this.category,
    this.brand,
    this.image,
  });

  WatchProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discount = json['discount'];
    specialExpiration = json['special_expiration'];
    discountPrice = json['discount_price'];
    productCount = json['product_count'];
    category = json['category'];
    brand = json['brand'];
    image = json['image'];
  }
}