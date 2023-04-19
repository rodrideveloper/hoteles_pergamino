import 'package:flutter/material.dart';

import 'hotel_model.dart';

class HomePage extends StatelessWidget {
  final List<HotelModel> listHotels = [
    HotelModel('Pension Pergamino', '2477-589305'),
    HotelModel('Hotel Roma', '2477-693556'),
    HotelModel('Hotel Fenicia', '24778545'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: listHotels.length,
              itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.abc),
                    title: Text(listHotels[index].name),
                    subtitle: Text(listHotels[index].contacto),
                  ))
        ],
      ),
    );
  }
}
