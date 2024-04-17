class UserCart {
  int? id;
  int? productId;
  String? product;
  int? count;

  UserCart({this.id, this.productId, this.product, this.count});

  UserCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    count = json['count'];
  }


}