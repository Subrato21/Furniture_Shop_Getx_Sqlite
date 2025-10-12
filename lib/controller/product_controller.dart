import 'package:furniture_shop/model/model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
// Categories
  final categories = <Category>[
    Category(id: "1", name: "Chairs"),
    Category(id: "2", name: "Tables"),
    Category(id: "3", name: "Cupboards"),
    Category(id: "4", name: "Lamps"),
  ].obs;

// Products
  final _products = <Product>[
    Product(
      id: "p1",
      name: "Modern Chair",
      category: "Chairs",
      type: "Armchair",
      imageUrl: "assets/images/chair.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 185,
      rating: 4.8,
      isNew: true,
    ),
    Product(
      id: "p2",
      name: "Minimalist Chair",
      category: "Chairs",
      type: "Armchair",
      imageUrl: "assets/images/chair.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 258,
      rating: 4.5,
      isNew: true,
    ),
    Product(
      id: "p3",
      name: "Wooden Table",
      category: "Tables",
      type: "Dining",
      imageUrl: "assets/images/table.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 320,
      rating: 4.6,
      isNew: true,
    ),
    Product(
      id: "p4",
      name: "Classic Table",
      category: "Tables",
      type: "Dining",
      imageUrl: "assets/images/table.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 230,
      rating: 4.95,
      isNew: true,
    ),
    Product(
      id: "p5",
      name: "Modern Cupboard",
      category: "Cupboards",
      type: "Decoration",
      imageUrl: "assets/images/cupboard.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 740,
      rating: 4.6,
      isNew: true,
    ),
    Product(
      id: "p6",
      name: "Vintage Cupboard",
      category: "Cupboards",
      type: "Decoration",
      imageUrl: "assets/images/cupboard.png",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 973,
      rating: 4.95,
      isNew: true,
    ),
    Product(
      id: "p7",
      name: "Modern Lamp",
      category: "Lamps",
      type: "Decoration",
      imageUrl: "assets/images/lamp.jpg",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 320,
      rating: 4.6,
      isNew: true,
    ),
    Product(
      id: "p8",
      name: "Vintage Lamp",
      category: "Lamps",
      type: "Decoration",
      imageUrl: "assets/images/lamp.jpg",
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 230,
      rating: 4.95,
      isNew: true,
    ),
  ].obs;

// Selected category
  var selectedCategory = "Chairs".obs;

  // Filtered products
  List<Product> get filteredProducts => products
      .where((product) => product.category == selectedCategory.value)
      .toList();

  // Change category
  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  //for best seller
  List<Product> get bestSellerCupboards =>
      products.where((product) => product.category == "Cupboards").toList();

  //customer cart
  final _cart = <Product>[].obs;

  //getter methods
  get products => _products;
  get cart => _cart;

  // add to cart
  void addToCart(Product productItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(productItem);
    }
  }

  //remove from cart

  void removeFromCart(Product product) {
    _cart.remove(product);
  }
}
