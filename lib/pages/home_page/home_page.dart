import 'package:flutter/material.dart';
import 'package:hoteles_pergamino/services/hotel_services.dart';

import 'hotel_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles Pergamino'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                 Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
            ListTile(
              leading: const Icon(Icons.hotel),
              title: const Text('Ver mapa'),
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
      ),
        body: Column(children: [
      FutureBuilder<List<HotelModel>>(
          future: HotelServices().getHotels(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
              case ConnectionState.active:
                if (snapshot.data != null) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ListTile(
                            leading: const Icon(Icons.abc),
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(snapshot.data![index].contact),
                          ));
                }
                return const SizedBox();
              default:
                //TODO: use a fallback screen when we have one
                return const SizedBox();
            }
          })
    ]));
  }
}
