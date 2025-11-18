import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

// Pastikan file stream.dart ada di folder yang sama
// import 'stream.dart';   // kalau pakai file terpisah

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Muhammad Nasih',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // Langkah 1: Variabel yang diminta di gambar
  late StreamSubscription subscription;
  late StreamSubscription subscription2;
  String values = '';

  late StreamController<int> numberStreamController;
  late NumberStream numberStream;
  late StreamTransformer<int, int> transformer;

  @override
  void initState() {
    super.initState();

    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Langkah 4: Jadikan stream sebagai Broadcast Stream
    // (harus dilakukan SEBELUM ada listener)
    Stream<int> broadcastStream = numberStreamController.stream.asBroadcastStream();

    // Transformer: kalikan 10 & tangani error
    transformer = StreamTransformer<int, int>.fromHandlers(
      handleData: (value, sink) {
        sink.add(value * 10);
      },
      handleError: (error, stackTrace, sink) {
        sink.add(-1);
      },
      handleDone: (sink) => sink.close(),
    );

    // Terapkan transformer ke broadcast stream
    Stream<int> stream = broadcastStream.transform(transformer);

    // Langkah 2: Dua subscription EXACTLY seperti di gambar
    subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    subscription2 = stream.listen((event) {
      setState(() {
        values += '$event - ';
      });
    });

    // Optional: tangani error agar tidak crash
    subscription.onError((e) => setState(() => values += 'Error! - '));
    subscription2.onError((e) => setState(() => values += 'Error! - '));
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // 0-9
    numberStream.addNumberToSink(myNum);

    // Untuk test error, uncomment baris berikut:
    // numberStream.addError();
  }

  @override
  void dispose() {
    subscription.cancel();
    subscription2.cancel();
    numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Muhammad Nasih'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Langkah 5: Tampilkan teks values persis seperti di gambar
            Text(
              values.isEmpty ? 'Tekan tombol untuk memulai' : values,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              onPressed: addRandomNumber,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('New Random Number'),
            ),

            ElevatedButton(
              onPressed: () => numberStream.addError(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Trigger Error (Test)'),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }

  void addError() {
    controller.sink.addError('Error sengaja dipicu untuk testing!');
  }

  void close() {
    controller.close();
  }
}