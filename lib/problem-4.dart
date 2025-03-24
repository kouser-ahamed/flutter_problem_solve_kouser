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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Styles Text",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Normal Text",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Text(
            "Bold Text",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          const Text(
            "Italic Text",
            style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.red),
          ),
          const SizedBox(height: 10),
          const Text(
            "Underlined Text",
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.underline,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Strikethrough Text",
            style: TextStyle(
              fontSize: 18,
              decoration: TextDecoration.lineThrough,
              color: Colors.orange,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Custom Font & Bigger Text",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: 'DMSans',
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Row Item 1",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.brown),
              ),
              SizedBox(width: 20),
              Text(
                "Row Item 2",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
