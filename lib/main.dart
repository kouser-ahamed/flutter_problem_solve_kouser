import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('First Application'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey, 
        ),
        body: const Center(
          child: Text(
            'Hello World!',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'DMSans',
              color: Colors.black, 
            ),
          ),
        ),
      ),
    );
  }
}
