import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedBoxScreen(),
    );
  }
}

class AnimatedBoxScreen extends StatefulWidget {
  const AnimatedBoxScreen({super.key});

  @override
  State<AnimatedBoxScreen> createState() => _AnimatedBoxScreenState();
}

class _AnimatedBoxScreenState extends State<AnimatedBoxScreen> {
  double boxWidth = 100;
  double boxHeight = 100;
  Color boxColor = Colors.teal;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  void changeBox() {
    setState(() {
      boxWidth = Random().nextInt(200) + 100;
      boxHeight = Random().nextInt(200) + 100;
      boxColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
      borderRadius = BorderRadius.circular(Random().nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            'Animated Container',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: boxWidth,
          height: boxHeight,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: borderRadius,
          ),
          curve: Curves.easeInOut,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeBox,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
