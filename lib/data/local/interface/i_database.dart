import 'package:kortobaa_core_package/kortobaa_core_package.dart';
import 'package:sqflite/sqflite.dart';

abstract class IDatabase {
  final String path;
  final String executor;

  Future<Database?> get database;

  Future<Database> init();

  Future<void> onCreate(Database db, int version);

  Future<void> insert(JsonMap data);

  Future<void> removeItem(String itemId);

  Future<void> removeAll();

  Future<List<dynamic>> fetch();

  Future<void> update(JsonMap data);

  const IDatabase._(this.path, this.executor);
}
