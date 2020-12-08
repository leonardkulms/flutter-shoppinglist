import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/Product.dart';

final database = db();
const tableProducts = 'products';

Future<Database> db() async {
  return openDatabase(
    join(await getDatabasesPath(), 'products_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS $tableProducts(id INTEGER PRIMARY KEY, name TEXT)',
      );
    },
    // Version provides path to perform database upgrades and downgrades.
    version: 1,
  );
}

Future<void> insertProduct(Product product) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Dog into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same dog is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    'products',
    product.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Product>> products() async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await db.query('products');

  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Product(
      id: maps[i]['id'],
      name: maps[i]['name'],
    );
  });
}

Future<void> updateProduct(Product product) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Dog.
  await db.update(
    'products',
    product.toMap(),
    // Ensure that the Dog has a matching id.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [product.id],
  );
}

Future<void> deleteProduct(int id) async {
  // Get a reference to the database.
  final db = await database;

  // Remove the Dog from the database.
  await db.delete(
    'products',
    // Use a `where` clause to delete a specific dog.
    where: "id = ?",
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

void initDB() async {
  var prod1 = Product(
    id: 1,
    name: 'dark chocolate',
  );

  var prod2 = Product(
    id: 2,
    name: 'toast',
  );
  // Insert a product into the database.
  await insertProduct(prod1);

  await insertProduct(prod2);
}
