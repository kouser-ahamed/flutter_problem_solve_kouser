import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: BottomNavApp()));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Galaxy A54 5G',
        'price': '\$350.00',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEApOoLB_Ik6bWxB1lHJGSH-tthkyrJHioiA&s'
      },
      {
        'name': 'MacBook Air',
        'price': '\$1050.00',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuZ6hELSvNCVMLdwtcYDHy7Rpv7b9X407Ty8dgrqC8ey9J8JJpToFZPSNOgrOisUfKKHc&usqp=CAU'
      },
      {
        'name': 'Nokia 215 4G',
        'price': '\$89.99',
        'image': 'https://m.media-amazon.com/images/I/41P9mkmB9oL._BO30,255,255,255_UF900,850_SR1910,1000,0,C_ZA8%252C384,500,900,420,420,AmazonEmber,50,4,0,0_PIRIOTHREEANDHALF-medium,BottomLeft,30,-20_QL100_.jpg'
      },
    ];

    return ListView.builder(
      key: const ValueKey('home'), // Added key
      padding: const EdgeInsets.all(12),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              product['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              product['price']!,
              style: const TextStyle(color: Colors.green),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product['name']} added to cart!')),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const ValueKey('search'), // Added key
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Products',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 40),
          const Center(
            child: Icon(
              Icons.search_outlined,
              size: 100,
              color: Colors.blueAccent,
            ),
          ),
          const Center(
            child: Text(
              'Search your favorite items',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const ValueKey('profile'), // Added key
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZhzZPyW9cpDwcxFVDmuGpGM9dPVjQzcwjRQ&s',
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Cena',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Professional Wrestler, Actor, and Philanthropist',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Cena is a 16-time WWE Champion, one of the most celebrated wrestlers of all time. Aside from his career in the ring, Cena is also an actor and philanthropist, known for his work in the Make-A-Wish Foundation.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook),
                onPressed: () => print("Facebook Profile"),
              ),
              IconButton(
                icon: const Icon(Icons.inbox),
                onPressed: () => print("Instagram Profile"),
              ),
              IconButton(
                icon: const Icon(Icons.tab),
                onPressed: () => print("Twitter Profile"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  State<BottomNavApp> createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bottom Nav App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
