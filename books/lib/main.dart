import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'navigation_first.dart';
import 'navigation_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books - MUHAMMAD NASIH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationDialogScreen(), // ganti jika mau NavigationFirst()
      // home: const NavigationFirst(),
    );
  }
}

// =========================================================
// HALAMAN FUTURE / LATIHAN ASYNC & ERROR HANDLING
// (masih tetap disimpan untuk praktikum Anda 👇)
// =========================================================

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool loading = false;

  late Completer<int> completer;

  Future<int> getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }

  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/junbDwAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  void returnFG() {
    setState(() {
      loading = true;
      result = 'Menghitung...';
    });

    Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]).then((values) {
      int total = values.reduce((a, b) => a + b);
      setState(() {
        result = 'Total: $total';
      });
    }).catchError((e) {
      setState(() {
        result = 'Terjadi error: $e';
      });
    }).whenComplete(() => setState(() => loading = false));
  }

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  Future handleError() async {
    setState(() {
      loading = true;
      result = 'Menangani error...';
    });

    try {
      await returnError();
      setState(() {
        result = 'Success';
      });
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
      print('Complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future - MUHAMMAD NASIH'),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),

            ElevatedButton(
              onPressed: returnFG,
              child: const Text('GO! (Future.wait)'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  loading = true;
                  result = 'Menjalankan returnError()...';
                });

                returnError()
                    .then((_) => setState(() => result = 'Success'))
                    .catchError((e) => setState(() => result = e.toString()))
                    .whenComplete(() => setState(() => loading = false));
              },
              child: const Text('Uji Error (.catchError)'),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: handleError,
              child: const Text('Uji Error (try-catch)'),
            ),

            const Spacer(),
            if (loading) const CircularProgressIndicator(),
            if (!loading)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SelectableText(result),
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
