import 'dart:math';

import 'package:flutter/material.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final double boxSize = 150;
  late double borderRadius;
  late double margin;
  late Color color;

  double posX = 0;
  double posY = 0;

  double randomBorderRadius() {
    return Random().nextDouble() * 100;
  }

  double randomMargin() {
    return Random().nextDouble() * 100;
  }

  Color randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  void initState() {
    super.initState();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
    color = randomColor();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;
      setState(() {
        posX = (width - boxSize) / 2;
        posY = (height - boxSize) / 2 - 50;
      });
    });
  }

  void changeState() {
    setState(() {
      borderRadius = randomBorderRadius();
      color = randomColor();
      margin = randomMargin();
    });
  }

  void updatePosition(DragUpdateDetails details) {
    setState(() {
      posX += details.delta.dx;
      posY += details.delta.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: posX,
              top: posY,
              child: GestureDetector(
                onPanUpdate: updatePosition,
                onTap: () {
                  changeState();
                },
                child: AnimatedContainer(
                  width: boxSize,
                  height: boxSize,
                  duration: const Duration(milliseconds: 1500),
                  // margin: EdgeInsets.all(margin),
                  curve: Curves.easeIn,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
