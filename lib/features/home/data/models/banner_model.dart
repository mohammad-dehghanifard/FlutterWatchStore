class Banner {
  int? id;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  Banner({this.id, this.title, this.image, this.createdAt, this.updatedAt});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}