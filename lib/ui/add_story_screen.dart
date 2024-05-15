import 'package:flutter/material.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: 'image_animation',
        child: Image.asset(
          'assets/bromo.jpg',
        ),
      ),
    );
  }
}
