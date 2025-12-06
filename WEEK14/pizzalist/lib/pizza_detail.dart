import 'package:flutter/material.dart';
import 'pizza.dart';
import 'http_helper.dart';

final TextEditingController txtId = TextEditingController();
final TextEditingController txtName = TextEditingController();
final TextEditingController txtDescription = TextEditingController();
final TextEditingController txtPrice = TextEditingController();
final TextEditingController txtImageUrl = TextEditingController();

String operationResult = '';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza? pizza;  // <-- tambahkan ini

  const PizzaDetailScreen({super.key, this.pizza});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  void initState() {
    super.initState();

    // Jika edit pizza, isi field
    if (widget.pizza != null) {
      txtId.text = widget.pizza!.id?.toString() ?? "";
      txtName.text = widget.pizza!.pizzaName;
      txtDescription.text = widget.pizza!.description;
      txtPrice.text = widget.pizza!.price.toString();
      txtImageUrl.text = widget.pizza!.imageUrl;
    }
  }

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  Future postPizza() async {
    HttpHelper helper = HttpHelper();
    Pizza pizza = Pizza();

    pizza.id = int.tryParse(txtId.text);
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text) ?? 0.0;
    pizza.imageUrl = txtImageUrl.text;

    String result = await helper.postPizza(pizza);

    setState(() {
      operationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Detail')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: () => postPizza(),
                child: const Text("Send Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
