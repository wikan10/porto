import 'package:flutter/material.dart';
import 'package:myapp/ui/add_story_screen.dart';
import 'package:myapp/ui/info_detail_screen.dart';

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
      drawer: _drawer(),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
        selectedItemColor: Colors.blue, // Warna saat item dipilih
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // Ubah warna sesuai preferensi Anda
            ),
            child: Icon(Icons.person),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Accont'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const InfoDetailScreen()));
            },
            icon: const Icon(Icons.info))
      ],
    );
  }
}
