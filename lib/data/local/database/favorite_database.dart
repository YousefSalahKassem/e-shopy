import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/blocs/model/product_model.dart';
import 'package:flutter_boilerplate/data/local/constants/tables.dart';
import 'package:flutter_boilerplate/data/local/interface/i_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteDatabase implements IDatabase {
  static Database? _database;
  static final provider =
      Provider<FavoriteDatabase>((ref) => FavoriteDatabase._());

  FavoriteDatabase._();

  @override
  String get path => Tables.databaseFavorite;

  @override
  String get executor => '''
      CREATE TABLE ${Tables.favoriteTable} (
        favoriteId INTEGER PRIMARY KEY,
        ${Tables.columnId} TEXT NOT NULL,
        ${Tables.columnName} TEXT NOT NULL,
        ${Tables.columnImage} TEXT NOT NULL,
        ${Tables.columnPrice} REAL NOT NULL,
        ${Tables.columnCategory} TEXT NOT NULL,
        ${Tables.columnDescription} TEXT NOT NULL,
        ${Tables.columnV} INTEGER NOT NULL
      )
    ''';

  @override
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await init();
    return _database;
  }

  @override
  Future<Database> init() async {
    debugPrint('init database');
    final databasePath = await getDatabasesPath();
    final paths = join(databasePath, path);
    final database = await openDatabase(paths, version: 1, onCreate: onCreate);
    return database;
  }

  @override
  Future<void> onCreate(Database db, int version) async {
    await db.execute(executor);
  }

  @override
  Future<void> insert(JsonMap data) async {
    final db = await database;
    await db!.insert(Tables.favoriteTable, data,
        conflictAlgorithm: ConflictAlgorithm.replace,);
  }

  @override
  Future<List> fetch() async {
    final db = await database;
    final List<dynamic> favorites = await db!.query(Tables.favoriteTable);
    return favorites;
  }

  @override
  Future<void> update(JsonMap data) async {
    final db = await database;
    await db!.update(Tables.favoriteTable, data,
        where: '${Tables.columnStatus} = ?', whereArgs: [data['id']],);
  }

  @override
  Future<void> removeItem(String itemId) async {
    final db = await database;
    await db!.delete(Tables.favoriteTable,
        where: '${Tables.columnName} = ?', whereArgs: [itemId],);
  }

  @override
  Future<void> removeAll() async {
    final db = await database;
    await db!.delete(Tables.favoriteTable);
  }

    Future<bool> checkFavorite(Product product) async {
      final db = await database;
      final List<dynamic> favourites = await db!.query(Tables.favoriteTable,
          where: '${Tables.columnName} = ?', whereArgs: [product.name],);
      if(favourites.isNotEmpty) return true;
      return false;
    }
}
