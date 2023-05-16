class Product {
  String name;
  String description;
  double price;
  int stock;
  String imageUrl;
  int id;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        imageUrl: json["imageURL"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "stock": stock,
        "imageURL": imageUrl,
        "id": id,
      };
}
