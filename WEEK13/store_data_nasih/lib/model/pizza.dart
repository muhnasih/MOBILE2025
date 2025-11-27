class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Langkah 13: fromJson
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      pizzaName: json['pizzaName'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }

  // Langkah 23: toJson
  Map<String, dynamic> toJson() => {
        "id": id,
        "pizzaName": pizzaName,
        "description": description,
        "price": price,
        "imageUrl": imageUrl,
      };
}
