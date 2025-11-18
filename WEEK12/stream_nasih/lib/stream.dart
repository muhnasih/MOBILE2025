import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % _colors.length;
        return _colors[index];
      },
    );
  }
}

// Langkah 2-5: Class NumberStream lengkap
class NumberStream {
  // Langkah 3: Tambah StreamController
  final StreamController<int> controller = StreamController<int>();

  // Langkah 4: Tambah method addNumberToSink
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // Langkah 5: Tambah method close
  void close() {
    controller.close();
  }

  // Langkah 13: Tambah method addError
  void addError() {
    controller.sink.addError('error');
  }
}