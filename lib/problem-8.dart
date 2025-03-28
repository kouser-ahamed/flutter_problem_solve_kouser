import 'package:flutter/material.dart';

void main() {
  runApp(const DrawerApp());
}

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Drawer'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Center(child: Text('Menu', style: TextStyle(fontSize: 24, color: Colors.white))),
            ),
            _buildDrawerItem(Icons.home, 'Home', () => Navigator.pop(context)),
            _buildDrawerItem(Icons.image, 'Gallery', () => _navigateTo(context, const ImageGallery())),
            _buildDrawerItem(Icons.settings, 'Settings', () => _navigateTo(context, const SettingsScreen())),
            _buildDrawerItem(Icons.info, 'About', () => _navigateTo(context, const AboutScreen())),
          ],
        ),
      ),
      body: _buildCenteredText('Home Screen'),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  static void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static AppBar _buildAppBar(String title) {
    return AppBar(title: Text(title), centerTitle: true, backgroundColor: Colors.teal);
  }

  static Widget _buildCenteredText(String text) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)));
  }
}

class ImageGallery extends StatelessWidget {
  const ImageGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreen._buildAppBar('Gallery View'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12.0, mainAxisSpacing: 12.0,
                ),
                itemCount: 6,
                itemBuilder: (context, index) => _buildImageCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), spreadRadius: 1, blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_piBsl8BVptf_RnnWGDEEpgBtCEPfVXfO6w&s',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeScreen._buildAppBar('Settings'), body: HomeScreen._buildCenteredText('Settings Screen'));
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HomeScreen._buildAppBar('About'), body: HomeScreen._buildCenteredText('About Screen'));
  }
}
