import 'package:flutter/material.dart';
import 'package:hoteles_pergamino/pages/home_page/views/home_view.dart';

import 'views/map_view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    MapView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

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
        body: _children[_tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueAccent,
            selectedItemColor: Colors.white,
            onTap: onTabTapped,
            currentIndex: _tabIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
            ]));
  }
}
