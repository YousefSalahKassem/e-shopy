import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/data/local/constants/tables.dart';
import 'package:flutter_boilerplate/data/local/interface/i_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kortobaa_core_package/kortobaa_core_package.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AddressDatabase implements IDatabase {
  static Database? _database;
  static final provider = Provider<AddressDatabase>((ref) {
    return AddressDatabase._();
  });

  AddressDatabase._();

  @override
  String get path => Tables.databaseAddress;

  @override
  String get executor => '''
      CREATE TABLE ${Tables.addressTable} (
        addressId INTEGER PRIMARY KEY,
        ${Tables.columnCountry} TEXT NOT NULL,
        ${Tables.columnCity} TEXT NOT NULL,
        ${Tables.columnStreet} TEXT NOT NULL,
        ${Tables.columnPostcode} TEXT NOT NULL
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
    await db!.insert(Tables.addressTable, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<List<dynamic>> fetch() async {
    final db = await database;
    final List<dynamic> addresses = await db!.query(Tables.addressTable);
    return addresses;
  }

  @override
  Future<void> update(JsonMap data) async {
    final db = await database;
    await db!.update(Tables.addressTable, data, where: '${Tables.columnStreet} = ?', whereArgs: [data['street']]);
  }

  @override
  Future<void> removeItem(String itemId) async {
    final db = await database;
    await db!.delete(Tables.addressTable, where: '${Tables.columnStreet} = ?', whereArgs: [itemId]);
  }

  @override
  Future<void> removeAll() async {
    final db = await database;
    await db!.delete(Tables.addressTable);
  }
}
