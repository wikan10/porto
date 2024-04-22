import 'package:flutter/material.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // OutlinedButton(onPressed: () {}, child: Center(child: Text('post'))),
        IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow))
      ],
    ));
  }
}
