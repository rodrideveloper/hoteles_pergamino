import 'package:flutter/material.dart';
import 'package:hoteles_pergamino/pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(Object context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
