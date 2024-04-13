class Properties {
  String? property;
  String? value;

  Properties({this.property, this.value});

  Properties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    value = json['value'];
  }


}