class ProductColor {
  String? title;
  String? code;

  ProductColor({this.title, this.code});

  ProductColor.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }


}