class Pizza {
  final String pizzaName;
  final String description;
  final double price;

  Pizza({
    required this.pizzaName,
    required this.description,
    required this.price,
  });

  // Factory constructor untuk membuat objek Pizza dari JSON
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      pizzaName: json['pizzaName'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0),
    );
  }

  // Convert kembali ke JSON jika dibutuhkan
  Map<String, dynamic> toJson() {
    return {
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
    };
  }
}
