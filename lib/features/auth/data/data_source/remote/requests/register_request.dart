class RegisterRequest {
  RegisterRequest({
    this.phone,this.name,this.postalCod,this.address,this.lng,this.lat
});
  int? postalCod;
  String? name,address,phone;
  double? lat,lng;
}
