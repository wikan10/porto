import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:myapp/ui/add_story_screen.dart';
import 'package:myapp/ui/login_screen.dart';
import 'package:share_plus/share_plus.dart';

class tempatwisata extends StatefulWidget {
  const tempatwisata({super.key});

  @override
  State<tempatwisata> createState() => _tempatwisataState();
}

class Destination {
  final String name;
  final String location;
  final String imageUrl;
  final String description;

  Destination({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
  });
}

List<Destination> destinations = [
  Destination(
    name: 'Gunung Bromo',
    location: 'Jawa Timur, Indonesia',
    imageUrl:
        'https://images.unsplash.com/photo-1602154663343-89fe0bf541ab?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnQlMjBicm9tb3xlbnwwfHwwfHx8MA%3D%3D', // Replace with an actual image URL
    description:
        'Gunung Bromo adalah gunung berapi aktif yang terletak di Jawa Timur, Indonesia. Gunung ini terkenal dengan pemandangan matahari terbitnya yang indah dan kalderanya yang luas.',
  ),
  Destination(
    name: 'Pantai Piaynemo',
    location: 'Raja Ampat, Papua Barat, Indonesia',
    imageUrl:
        'https://media.istockphoto.com/id/979296970/photo/top-view-of-piaynemo.webp?b=1&s=170667a&w=0&k=20&c=kmpyI7xpaEIoPSI7CDqlJ5WRT_ZpZLwKyEtdY-UCJww=',
    description:
        'Pantai Piaynemo adalah salah satu pantai terindah di Raja Ampat, Papua Barat, Indonesia. Pantai ini terkenal dengan pulau-pulau karstnya yang unik, air lautnya yang jernih, dan pasir putihnya yang halus.',
  ),
  Destination(
    name: 'Danau Toba',
    location: 'Sumatera Utara, Indonesia',
    imageUrl:
        'https://media.istockphoto.com/id/1219758666/photo/lake-toba-and-samosir-island-view-from-above-sumatra-indonesia-huge-volcanic-caldera-covered.webp?b=1&s=170667a&w=0&k=20&c=saWcxD1X0G50gnLwCUZsLNZq0m124xrpPmpaiJo1j_w=', // Replace with an actual image URL
    description:
        'Danau Toba adalah danau vulkanik terbesar di dunia. Danau ini terletak di Sumatera Utara, Indonesia dan terkenal dengan pemandangannya yang indah dan pulau Samosir di tengahnya.',
  ),
  Destination(
    name: 'Pangalengan',
    location: 'Jawa Barat, Indonesia',
    imageUrl:
        'https://images.unsplash.com/photo-1549473889-14f410d83298?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHBhbmdhbGVuZ2FufGVufDB8fDB8fHww', // Replace with an actual image URL
    description:
        'Pangalengan adalah wilayah dataran tinggi yang terletak di Jawa Barat, Indonesia. Daerah ini terkenal dengan udaranya yang sejuk, perkebunan tehnya yang luas, dan wisata alamnya yang indah.',
  ),
];

class _tempatwisataState extends State<tempatwisata> {
  int? _hoveringIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tempat Wisata"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];

          return GestureDetector(
            onTap: () => _showDetails(context, destination.imageUrl),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: MouseRegion(
                onEnter: (event) => _onHover(true, index),
                onExit: (event) => _onHover(false, index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  transform: Matrix4.identity()
                    ..scale(_hoveringIndex == index ? 1.05 : 1.0),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      destination.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
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

  void _onHover(bool hover, int index) {
    setState(() {
      _hoveringIndex = hover ? index : null;
    });
  }

  void _showDetails(BuildContext context, String imageUrl) {
    // Find the destination matching the image URL (optional)
    Destination? matchingDestination;
    for (final destination in destinations) {
      if (destination.imageUrl == imageUrl) {
        matchingDestination = destination;
        break; // Stop iterating once a match is found
      }
    }

    showModal(
      context: context,
      builder: (context) {
        final destination = matchingDestination ??
            destinations.first; // Use first destination if no match found

        return AlertDialog(
          title: Text(destination.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(imageUrl),
              const SizedBox(height: 10),
              Text(
                destination.location,
                style: TextStyle(fontSize: 16),
              ),
              Text(destination.description),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Add your bookmark functionality here
              },
              child: const Icon(Icons.bookmark),
            ),
            TextButton(
              onPressed: () {
                final shareText = '''
                **Tempat Wisata Menarik:** ${destination.name}

                **Lokasi:** ${destination.location}

                **Deskripsi:**
                ${destination.description}

                **Lihat Foto:** ${destination.imageUrl}

                **Bagikan Temanmu:**
                #wisatadunia #travelgram #indonesia #explore
                ''';
                Share.share(shareText);
              },
              child: const Icon(Icons.share),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}
