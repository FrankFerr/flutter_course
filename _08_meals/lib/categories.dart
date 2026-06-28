import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: const [
          Text('cella 1', style: TextStyle(color: Colors.white)),
          Text('cella 2', style: TextStyle(color: Colors.white)),
          Text('cella 3', style: TextStyle(color: Colors.white)),
          Text('cella 4', style: TextStyle(color: Colors.white)),
          Text('cella 5', style: TextStyle(color: Colors.white)),
          Text('cella 6', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
