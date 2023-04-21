import 'dart:convert';

import 'package:hoteles_pergamino/pages/home_page/hotel_model.dart';
import 'package:hoteles_pergamino/services/cliente_http.dart';
import 'package:http/http.dart';

class HotelServices {
  final String BASE_URL = "ambosmedicos.com.ar";
  final String END_POINT = "/hoteles.txt";

  Future<List<HotelModel>> getHotels() async {
    List<HotelModel> list_hotels = [];

    Response response = await ClientHttp().get(BASE_URL, END_POINT);

    Map<String, dynamic> result = json.decode(response.body);
    List list = result['hoteles'];

    list.forEach((element) {
      list_hotels.add(HotelModel.fromMap(element));
    });
    return list_hotels;
  }
}
