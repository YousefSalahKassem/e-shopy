import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/blocs/model/local/cart_model.dart';
import 'package:flutter_boilerplate/data/local/constants/tables.dart';
import 'package:flutter_boilerplate/data/local/interface/i_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase implements IDatabase{
  static final provider = Provider((ref) => CartDatabase._());
  CartDatabase._();

  static Database? _database;
  @override
  // TODO: implement path
  String get path => Tables.databaseCart;

  @override
  // TODO: implement executor
  String get executor => '''
      CREATE TABLE ${Tables.cartTable} (
        cartId INTEGER PRIMARY KEY,
        ${Tables.columnQuantity} INTEGER NOT NULL,
        ${Tables.columnId} TEXT NOT NULL
      )
    ''';

  @override
  // TODO: implement database
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await init();
    return _database;
  }

  @override
  Future<Database> init() async{
    debugPrint('init database');
    final databasePath = await getDatabasesPath();
    final paths = join(databasePath, path);
    final database = await openDatabase(paths, version: 1, onCreate: onCreate);
    return database;
  }

  @override
  Future<void> onCreate(Database db, int version) {
    return db.execute(executor);
  }

  @override
  Future<void> insert(JsonMap data) async{
    final db = await database;
    await db!.insert(Tables.cartTable, data,
        conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  @override
  Future<List> fetch() async {
    final db = await database;
    final List<dynamic> items = await db!.query(Tables.cartTable);
    return items;
  }

  @override
  Future<void> update(JsonMap data) async {
    final db = await database;
    await db!.update(Tables.cartTable, data,
      where: '${Tables.columnId} = ?', whereArgs: [data['name']],);
  }

  @override
  Future<void> removeItem(String itemId) async {
    final db = await database;
    await db!.delete(Tables.cartTable,
      where: '${Tables.columnId} = ?', whereArgs: [itemId],);
  }

  @override
  Future<void> removeAll() async {
    final db = await database;
    await db!.delete(Tables.cartTable);
  }


  Future<bool> checkIfItemExists(CartModel product) async{
    final db = await database;
    final List<dynamic> items = await db!.query(Tables.cartTable,
        where: '${Tables.columnId} = ?', whereArgs: [product.id],);
    return items.isNotEmpty;
  }
}
