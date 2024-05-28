import 'package:flutter/material.dart';
import 'package:myapp/ui/add_story_screen.dart';
import 'package:myapp/ui/info_detail_screen.dart';
import 'package:myapp/ui/login_screen.dart';
import 'package:myapp/ui/tempat_wisata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStoryScreen()));
        },
        child: Hero(
          tag: 'image_animation',
          child: Center(
            child: Image.asset(
              'assets/bromo.jpg',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
      drawer: _drawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStoryScreen()));
        },
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tempatwisata()));
          } else if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        selectedItemColor: Colors.blue, // Warna saat item dipilih
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Ubah warna sesuai preferensi Anda
            ),
            child: Icon(Icons.person),
          ),
          ExpansionTile(
            leading: Icon(Icons.dashboard),
            title: Text('Menu Utama'),
            children: <Widget>[
              ListTile(
                leading: Icon(
                    Icons.account_circle), // Icon diubah menjadi icon account
                title: Text('Accont'),
                onTap: () {
                  Navigator.pop(context); // Tutup drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.local_airport),
                title: Text('Submenu 2'),
                onTap: () {},
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Pengaturan'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('My App'),
      backgroundColor: Colors.amber,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InfoDetailScreen()));
            },
            icon: const Icon(Icons.info))
      ],
    );
  }
}
