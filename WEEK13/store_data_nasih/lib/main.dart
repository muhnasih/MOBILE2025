import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'model/pizza.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Data - Nasih',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = [];

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  // Langkah 18: Mengembalikan Future<List<Pizza>>
  Future<List<Pizza>> readJsonFile() async {
    final String response =
        await rootBundle.loadString('assets/pizzalist.json');

    List<dynamic> pizzaMapList = jsonDecode(response);

    List<Pizza> pizzas =
        pizzaMapList.map((pizzaMap) => Pizza.fromJson(pizzaMap)).toList();

    // Langkah 24–25: cetak kembali ke JSON
    String backToJson = convertToJSON(pizzas);
    print(backToJson);

    return pizzas;
  }

  // Convert List<Pizza> → JSON String
  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((p) => p.toJson()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza Menu - Nasih"),
      ),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
          );
        },
      ),
    );
  }
}
