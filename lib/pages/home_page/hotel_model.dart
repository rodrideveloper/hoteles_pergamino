class HotelModel {
  String name;
  String contact;

  HotelModel(this.name, this.contact);

  static HotelModel fromMap(Map<String, dynamic> json) {
    return HotelModel(
      json['name'].toString(),
      json['contact'].toString(),
    );
  }
}
