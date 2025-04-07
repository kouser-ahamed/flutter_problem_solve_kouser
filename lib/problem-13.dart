import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomAppBarScreen(),
    );
  }
}

class CustomAppBarScreen extends StatelessWidget {
  const CustomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTOt-6V6dGzPrO-hMTY7r2uec99Te0pXFJJg&s',
                height: 35,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Product Logo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint('Menu pressed');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is a custom AppBar!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
