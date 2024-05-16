import 'package:flutter/material.dart';

class InfoDetailScreen extends StatefulWidget {
  const InfoDetailScreen({super.key});

  @override
  State<InfoDetailScreen> createState() => _InfoDetailScreenState();
}

class _InfoDetailScreenState extends State<InfoDetailScreen> {
  final double boxSize = 150;
  int numOfSingleTap = 0;
  int numOfDoubleTap = 0;
  int numOfLongPress = 0;

  late double posX;
  late double posY;

  @override
  void initState() {
    super.initState();
    // Initialize position in the center
    posX = 0;
    posY = 0;
  }

  @override
  Widget build(BuildContext context) {
    // Center position on first build
    if (posX == 0) {
      centerPosition(context);
    }

    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            posX += details.delta.dx;
            posY += details.delta.dy;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: posX,
              top: posY,
              child: GestureDetector(
                // onVerticalDragUpdate: (DragUpdateDetails details) {
                //   // double delta = details.delta.dy;
                //   double verticalPosition = details.delta.dy;
                //   setState(() {
                //     posY += verticalPosition;
                //   });
                // },
                // onHorizontalDragUpdate: (DragUpdateDetails details) {
                //   // double delta = details.delta.dy;
                //   double horizontalPositon = details.delta.dx;
                //   setState(() {
                //     posX += horizontalPositon;
                //   });
                // },
                onTap: () {
                  setState(() {
                    numOfSingleTap++;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    numOfDoubleTap++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    numOfLongPress++;
                  });
                },
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  color: const Color.fromARGB(255, 8, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(127, 33, 149, 243),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ' - Taps: $numOfSingleTap  - Double Taps: $numOfDoubleTap  - Long Press: $numOfLongPress ',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void centerPosition(BuildContext context) {
    setState(() {
      posX = (MediaQuery.of(context).size.width - boxSize) / 2;
      posY = (MediaQuery.of(context).size.height - boxSize) / 2;
    });
  }
}
