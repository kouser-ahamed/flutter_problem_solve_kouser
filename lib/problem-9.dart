import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  const CardListScreen({super.key});

  final List<Item> items = const [
    Item(
      image: 'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png',
      title: ' Framed Perspective',
      subtitle: 'Capturing the Road Within a Screen',
      description: 'A person holds up an old Nokia mobile phone, which displays the same road stretching ahead, creating a unique layered perspective.The scene is set at dusk,with a bridge overhead and the fading sunlight adding depth and contrast to the composition.',
    ),
    Item(
      image: 'https://iso.500px.com/wp-content/uploads/2018/05/Blog-marketplace-getty500px-48429366-nologo-3000x2000.png',
      title: 'Harvesting Harmony',
      subtitle: 'A Farmers Journey Through Golden Fields',
      description: 'A farmer walks through a lush green and golden rice field,carrying harvested crops on his shoulders.The backdrop of rolling hills and misty mountains adds a serene and picturesque charm to the rural landscape',
    ),
    Item(
      image: 'https://assets.imgix.net/hp/snowshoe.jpg?w=1000',
      title: 'Winter Adventure',
      subtitle: 'Snowshoeing into the Sunset',
      description: 'A lone adventurer treks through pristine snow on snowshoes, leaving a trail behind as the golden sunset bathes the winter landscape in warm light. The snow-covered trees and distant cabin add to the serene and breathtaking atmosphere of the wilderness.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Animated Cards')),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) => CustomCard(
          image: items[index].image,
          title: items[index].title,
          subtitle: items[index].subtitle,
          description: items[index].description,
        ),
      ),
    );
  }
}

class Item {
  final String image, title, subtitle, description;
  const Item({required this.image, required this.title, required this.subtitle, required this.description});
}

class CustomCard extends StatefulWidget {
  final String image, title, subtitle, description;
  const CustomCard({super.key, required this.image, required this.title, required this.subtitle, required this.description});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late final Animation<double> _scale = Tween(begin: 1.0, end: 0.97).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  late final Animation<double> _elevation = Tween(begin: 4.0, end: 8.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(bool down) => down ? _controller.forward() : _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _onTap(true),
      onTapUp: (_) => _onTap(false),
      onTapCancel: () => _onTap(false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.scale(
          scale: _scale.value,
          child: Card(
            elevation: _elevation.value,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(widget.image, height: 180, fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(widget.subtitle, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600)),
                      const SizedBox(height: 12),
                      Text(widget.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
