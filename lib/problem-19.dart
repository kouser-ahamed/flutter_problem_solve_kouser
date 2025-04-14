import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedDrawerExample(),
    );
  }
}

class AnimatedDrawerExample extends StatefulWidget {
  const AnimatedDrawerExample({super.key});

  @override
  State<AnimatedDrawerExample> createState() => _AnimatedDrawerExampleState();
}

class _AnimatedDrawerExampleState extends State<AnimatedDrawerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      isDrawerOpen ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Animated Side Drawer'),
            backgroundColor: Colors.teal,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: toggleDrawer,
            ),
          ),
          body: const Center(
            child: Text(
              'Main Screen Content',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: SafeArea(
                child: Container(
                  width: 250,
                  height: double.infinity,
                  color: Colors.teal[700],
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Drawer Menu',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 30),
                      Text('Home',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      SizedBox(height: 15),
                      Text('Profile',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      SizedBox(height: 15),
                      Text('Settings',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
