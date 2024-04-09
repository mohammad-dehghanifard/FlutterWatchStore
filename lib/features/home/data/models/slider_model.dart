class SliderModel {
  int? id;
  String? title;
  String? image;

  SliderModel({this.id, this.title, this.image});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}