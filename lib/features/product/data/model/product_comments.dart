class ProductComment {
  String? user;
  String? body;

  ProductComment({this.user, this.body});

  ProductComment.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    body = json['body'];
  }


}
