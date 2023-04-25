import 'package:flutter/material.dart';
import 'package:hoteles_pergamino/pages/home_page/home_page.dart';
import 'package:hoteles_pergamino/pages/home_page/map_page.dart';
import 'package:hoteles_pergamino/services/hotel_services.dart';


void main() {
  runApp(const MyApp());
  HotelServices().getHotels();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
         routes: {
        '/map': (context) => const MapPage(),
      },
    );
  }
}
