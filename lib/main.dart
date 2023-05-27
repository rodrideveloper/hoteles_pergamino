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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple)),
      routes: {
        '/map': (context) => const MapPage(),
      },
    );
  }
}
