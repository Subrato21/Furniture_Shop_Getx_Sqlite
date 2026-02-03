import 'package:furniture_shop/model/model.dart';
import 'package:get/get.dart';
import 'package:furniture_shop/db/cart_db_helper.dart';

class ProductController extends GetxController {
  final CartDBHelper _cartDBHelper = CartDBHelper.getinstance;
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
      name: "Rocking Chair",
      category: "Chairs",
      type: "Armchair",
      imageUrl: ["assets/images/rockingchair 2.png"],
      description:
          "Designed for relaxed moments, this rocking chair adds subtle elegance to any room. Made from high-quality materials for balanced motion and long-term comfort.",
      price: 258,
      rating: 4.5,
      isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p2",
      name: "Modern Chair",
      category: "Chairs",
      type: "Armchair",
      imageUrl: ["assets/images/armchair.png"],
      description:
          "Simple & elegant shape makes it very suitable for those who want a minimalist room design. This is crafted from durable materials ensuring both comfort and longevity.",
      price: 185,
      rating: 4.8,
      //isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p3",
      name: "Modern Minimalist Dining Table",
      category: "Tables",
      type: "Dining",
      imageUrl: ["assets/images/Dining Table 2.png"],
      description:
          "Featuring clean lines and a sleek design, this table suits contemporary interiors effortlessly. Made with premium materials, it offers both functionality and long-lasting elegance.",
      price: 320,
      rating: 4.6,
      isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p4",
      name: "Elegant Oak Dining Table",
      category: "Tables",
      type: "Dining",
      imageUrl: ["assets/images/Dining Table.png"],
      description:
          "Crafted from solid oak, this dining table combines timeless style with durability. Its spacious surface and smooth finish make it perfect for family meals or entertaining guests.",
      price: 230,
      rating: 4.95,
      isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p5",
      name: "Vintage Cupboard",
      category: "Cupboards",
      type: "Decoration",
      imageUrl: ["assets/images/Vintage Cupboard.png"],
      description:
          "Timeless design with charming details brings character to any space. Crafted from sturdy materials, it combines classic elegance with practical storage for lasting use.",
      price: 973,
      rating: 4.95,
      isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p6",
      name: "Modern Cupboard",
      category: "Cupboards",
      type: "Decoration",
      imageUrl: ["assets/images/Cupboard 2.png"],
      description:
          "Sleek and functional design adds a contemporary touch to any room. Built with durable materials, it offers ample storage while maintaining a clean, minimalist look.",
      price: 740,
      rating: 4.6,
      //isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p7",
      name: "Modern Lamp",
      category: "Lamps",
      type: "Decoration",
      imageUrl: ["assets/images/Table Lamp 2.png"],
      description:
          "Sleek and contemporary design makes it perfect for enhancing any modern living space. Built with high-quality materials, it provides both style and long-lasting functionality.",
      price: 320,
      rating: 4.6,
      //isNew: true,
      quantity: 1,
    ),
    Product(
      id: "p8",
      name: "Vintage Table Lamp",
      category: "Lamps",
      type: "Decoration",
      imageUrl: ["assets/images/Table Lamp.png"],
      description:
          "Charming retro design adds character to any room while complementing classic decor. Made from sturdy materials, it delivers both elegance and enduring use.",
      price: 230,
      rating: 4.95,
      isNew: true,
      quantity: 1,
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

  @override
  void onInit() {
    super.onInit();
    _loadCartFromDB();
  }

  Future<void> _loadCartFromDB() async {
    final productsFromDB = await _cartDBHelper.getAllProducts();
    _cart.assignAll(productsFromDB);
  }

  // Add to cart (merge quantities if already present)
  Future<void> addToCart(Product product, [int quantity = 1]) async {
    int existingIndex = _cart.indexWhere((p) => p.id == product.id);

    if (existingIndex != -1) {
      // If product exists, update its quantity in memory and DB
      _cart[existingIndex].quantity += quantity;

      await _cartDBHelper.updateProductQuantity(
          product.id, _cart[existingIndex].quantity);

      _cart.refresh();
    } else {
      // If new product, set its quantity and add to cart & DB
      Product newProduct = Product(
        id: product.id,
        name: product.name,
        category: product.category,
        type: product.type,
        imageUrl: product.imageUrl,
        description: product.description,
        price: product.price,
        rating: product.rating,
        isNew: product.isNew,
        quantity: quantity,
      );

      await _cartDBHelper.insertProduct(newProduct);
      _cart.add(newProduct);
    }
  }

  // Update product quantity (used by + / - in CartTile)
  Future<void> updateCartQuantity(String id, int quantity) async {
    // update DB
    await _cartDBHelper.updateProductQuantity(id, quantity);

    // update in-memory list if present
    int idx = _cart.indexWhere((p) => p.id == id);
    if (idx != -1) {
      _cart[idx].quantity = quantity;
      _cart.refresh();
    }
  }

  // remove from cart
  Future<void> removeFromCart(Product product) async {
    await _cartDBHelper.deleteProduct(product.id);
    _cart.removeWhere((p) => p.id == product.id);
    _cart.refresh();
  }

  // Total price of all products in the cart
  double get totalCartPrice =>
      _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Clear cart
  Future<void> clearCart() async {
    await _cartDBHelper.clearCart();
    _cart.clear();
    _cart.refresh();
  }

  // Trigger UI refresh manually when needed
  void refreshCart() {
    _cart.refresh();
  }
}
