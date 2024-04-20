import 'package:flutter/material.dart';
import 'package:myapp/ui/add_story_screen.dart';
import 'package:myapp/ui/info_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(child: Text('No Story')),
      drawer: _drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddStoryScreen()));
        },
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
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
            child: Icon(Icons.person),
            decoration: BoxDecoration(
              color: Colors.blue, // Ubah warna sesuai preferensi Anda
            ),
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
                  MaterialPageRoute(builder: (context) => InfoDetailScreen()));
            },
            icon: Icon(Icons.info))
      ],
    );
  }
}
