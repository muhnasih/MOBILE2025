import 'package:flutter/material.dart';
import 'pizza_detail.dart';   // pastikan file ini ada
import 'pizza.dart';
import 'http_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HttpHelper helper;
  List<Pizza> pizzas = [];

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    loadPizzas();
  }

  Future<void> loadPizzas() async {
    List<Pizza> pizzaList = await helper.getPizzas();
    setState(() {
      pizzas = pizzaList;
    });
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(pizzas[index].pizzaName),
          subtitle: Text("Description: ${pizzas[index].description}"),
          trailing: Text("Price: \$${pizzas[index].price}"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PizzaDetailScreen(
                  pizza: pizzas[index],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pizza List"),
      ),

      body: buildListView(),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PizzaDetailScreen(),
            ),
          );
        },
      ),
    );
  }
}
