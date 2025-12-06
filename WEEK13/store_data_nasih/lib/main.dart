import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Langkah 3
import 'model/pizza.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Data - Nasih',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Langkah 4
  int appCounter = 0;

  // List Pizza
  List<Pizza> myPizzas = [];

  @override
  void initState() {
    super.initState();
    readAndWritePreference(); // Langkah 10
  }

  // Langkah 5–9: readAndWritePreference()
  Future<void> readAndWritePreference() async {
    // Langkah 6: Ambil instance
    final prefs = await SharedPreferences.getInstance();

    // Langkah 7: Baca dan cek null
    int counter = prefs.getInt('appCounter') ?? 0;

    // Increment
    counter++;

    // Langkah 8: Simpan kembali
    await prefs.setInt('appCounter', counter);

    // Langkah 9: Update UI
    setState(() {
      appCounter = counter;
    });
  }

  // Langkah 13: deletePreference()
  Future<void> deletePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // hapus semua data

    // Update UI
    setState(() {
      appCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preferences - Nasih"),
        backgroundColor: Colors.deepPurple,
      ),

      // Langkah 11 — UI menampilkan counter + tombol reset
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "You have opened the app:",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              "$appCounter times",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                deletePreference(); // Langkah 14
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              child: const Text(
                "Reset counter",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
