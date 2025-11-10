import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  // GANTI DENGAN WARNA FAVORIT ANDA
  Color color = Colors.tealAccent.shade400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        // TAMBAHKAN NAMA PANGGILAN ANDA DI SINI
        title: const Text('Navigation First Screen - Nasih'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  // Fungsi navigasi (akan diisi di langkah selanjutnya)
  Future<void> _navigateAndGetColor(BuildContext context) async {
    // TODO: Implementasi navigasi ke NavigationSecond
  }
}