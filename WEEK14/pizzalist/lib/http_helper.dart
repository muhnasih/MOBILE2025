import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pizza.dart';

class HttpHelper {
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  final String authority = 'pizzaserver.herokuapp.com';

  // -----------------------------
  // GET LIST PIZZAS
  // -----------------------------
  Future<List<Pizza>> getPizzas() async {
    const path = '/pizzalist';
    Uri url = Uri.https(authority, path);

    http.Response result = await http.get(url);

    if (result.statusCode == 200) {
      List<dynamic> data = json.decode(result.body);
      return data.map((e) => Pizza.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  // -----------------------------
  // POST PIZZA
  // -----------------------------
  Future<String> postPizza(Pizza pizza) async {
    const postPath = '/pizza';

    String post = json.encode(pizza.toJson());
    Uri url = Uri.https(authority, postPath);

    http.Response r = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: post,
    );

    return r.body;
  }
}
