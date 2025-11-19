// lib/random_screen.dart

import 'package:flutter/material.dart';
import 'random_bloc.dart';   // pastikan path-nya sesuai dengan lokasi file bloc Anda

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // Langkah 11: Buat variabel bloc
  final _bloc = RandomNumberBloc();

  // Langkah 12: Buat method dispose()
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  // Langkah 13: Edit method build()
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}