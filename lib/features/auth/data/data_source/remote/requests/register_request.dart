class RegisterRequest {
  RegisterRequest({
    this.phone,this.name,this.postalCod,this.address,this.lng,this.lat
});
  int? phone,postalCod;
  String? name,address;
  double? lat,lng;
}
