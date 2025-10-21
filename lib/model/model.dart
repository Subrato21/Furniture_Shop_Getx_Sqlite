class Product {
  final String id;
  final String name;
  final String category;
  final String type;
  final String imageUrl;
  final String description;
  final double price;
  final double rating;
  final bool isNew;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.type,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.rating,
    this.isNew = false,
    this.quantity = 1,
  });
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});
}
