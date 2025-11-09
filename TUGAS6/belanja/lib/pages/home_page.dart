import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item.dart';
import '../widgets/item_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Item> items = const [
  Item(name: 'Sugar', price: 5000, image: 'images/sugar.jpg', stock: 20, rating: 4.5),
  Item(name: 'Salt', price: 2000, image: 'images/salt.jpg', stock: 15, rating: 4.2),
  Item(name: 'Rice', price: 12000, image: 'images/rice.jpg', stock: 30, rating: 4.8),
  Item(name: 'Coffee', price: 15000, image: 'images/coffee.jpg', stock: 10, rating: 4.6),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Belanja'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemCard(
            item: item,
            onTap: () => context.push('/item', extra: item),
          );
        },
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Muhammad Nasih | 2341720009',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
