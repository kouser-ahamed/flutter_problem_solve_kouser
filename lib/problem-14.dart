import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipeable List',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SwipeableListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SwipeableListScreen extends StatefulWidget {
  const SwipeableListScreen({super.key});

  @override
  State<SwipeableListScreen> createState() => _SwipeableListScreenState();
}

class _SwipeableListScreenState extends State<SwipeableListScreen> {
  List<String> items = List.generate(8, (index) => 'Item ${index + 1}');

  List<Color> itemColors = [
    Colors.deepPurpleAccent,
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.tealAccent,
    Colors.lightBlueAccent,
    Colors.amberAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
  ];

  void _editItem(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${items[index]} edited')),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
      itemColors.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Item deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[600],
        title: const Text(
          'Swipeable List',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            background: Container(
              color: Colors.orange[400],
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red[600],
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _editItem(index);
                return false;
              } else {
                _deleteItem(index);
                return true;
              }
            },
            child: Card(
              color: itemColors[index],
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.label, color: Colors.white),
                title: Text(
                  items[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
