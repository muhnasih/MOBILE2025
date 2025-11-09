Praktikum 1: Mengunduh Data dari Web Service (API)
Langkah 1: Buat Project Baru
"flutter pub add http"

Langkah 2: Cek file pubspec.yaml
img/1.png

Langkah 3: Buka file main.dart
Langkah 4: Tambah method getData()
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {},
            ),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

Soal 2

Soal 3
Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
![alt text](img/2.png)

Pada langkah 5, kode substring(0, 450) digunakan untuk mengambil hanya 450 karakter pertama dari data response API agar tampilan output tidak terlalu panjang. Sementara itu, catchError berfungsi menangani kesalahan yang terjadi saat proses pemanggilan API, misalnya koneksi internet terputus atau server tidak merespon, sehingga aplikasi tidak error dan tetap menampilkan pesan “An error occurred”.

Praktikum 2: Menggunakan await/async untuk menghindari callbacks
Soal 4
Jelaskan maksud kode langkah 1 dan 2 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".
![alt text](img/3.png)

Praktikum 3: Menggunakan Completer di Future
Soal 5
Jelaskan maksud kode langkah 2 tersebut!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".
Pada langkah ini, kita menambahkan sebuah variabel dan dua method ke dalam class _FuturePageState untuk mengelola proses asynchronous secara manual menggunakan Completer.
![alt text](img/4.png)

