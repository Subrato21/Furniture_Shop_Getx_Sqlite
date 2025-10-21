import 'dart:io';
import 'package:furniture_shop/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CartDBHelper {
  CartDBHelper._();
  static final CartDBHelper getinstance = CartDBHelper._();

  static const String TABLE_CART = 'cart';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_NAME = 'name';
  static const String COLUMN_TYPE = 'type';
  static const String COLUMN_IMAGE_URL = 'imageUrl';
  static const String COLUMN_PRICE = 'price';
  static const String COLUMN_QUANTITY = 'quantity'; //  added quantity column

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, 'cartnewDB.db');

    return await openDatabase(
      path,
      version: 2, //  bumped version to recreate with new column
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $TABLE_CART(
            $COLUMN_ID TEXT PRIMARY KEY,
            $COLUMN_NAME TEXT,
            $COLUMN_TYPE TEXT,
            $COLUMN_IMAGE_URL TEXT,
            $COLUMN_PRICE REAL,
            $COLUMN_QUANTITY INTEGER
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        // Add quantity column if upgrading from old version
        if (oldVersion < 2) {
          await db.execute(
              'ALTER TABLE $TABLE_CART ADD COLUMN $COLUMN_QUANTITY INTEGER DEFAULT 1');
        }
      },
    );
  }

  //  Insert or Update Product
  Future<void> insertProduct(Product product) async {
    final db = await database;

    // Check if product already exists in the table
    final List<Map<String, dynamic>> existingProduct = await db.query(
      TABLE_CART,
      where: '$COLUMN_ID = ?',
      whereArgs: [product.id],
    );

    if (existingProduct.isNotEmpty) {
      // Product exists → update quantity
      int currentQuantity = existingProduct.first[COLUMN_QUANTITY] as int;
      int newQuantity = currentQuantity + product.quantity;

      await db.update(
        TABLE_CART,
        {COLUMN_QUANTITY: newQuantity},
        where: '$COLUMN_ID = ?',
        whereArgs: [product.id],
      );
    } else {
      // Insert new product
      await db.insert(
        TABLE_CART,
        {
          COLUMN_ID: product.id,
          COLUMN_NAME: product.name,
          COLUMN_TYPE: product.type,
          COLUMN_IMAGE_URL: product.imageUrl,
          COLUMN_PRICE: product.price,
          COLUMN_QUANTITY: product.quantity, // ✅ new
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  //  Update product quantity manually (from + / - buttons)
  Future<void> updateProductQuantity(String id, int newQuantity) async {
    final db = await database;
    await db.update(
      TABLE_CART,
      {COLUMN_QUANTITY: newQuantity},
      where: '$COLUMN_ID = ?',
      whereArgs: [id],
    );
  }

  //  Get all products (with quantity)
  Future<List<Product>> getAllProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(TABLE_CART);

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i][COLUMN_ID],
        name: maps[i][COLUMN_NAME],
        type: maps[i][COLUMN_TYPE],
        imageUrl: maps[i][COLUMN_IMAGE_URL],
        price: maps[i][COLUMN_PRICE],
        quantity: maps[i][COLUMN_QUANTITY] ?? 1, // ✅ read quantity
        category: '',
        description: '',
        rating: 0.0,
        isNew: false,
      );
    });
  }

  //  Delete a product by id
  Future<void> deleteProduct(String id) async {
    final db = await database;
    await db.delete(TABLE_CART, where: '$COLUMN_ID = ?', whereArgs: [id]);
  }

  //  Clear all
  Future<void> clearCart() async {
    final db = await database;
    await db.delete(TABLE_CART);
  }
}
