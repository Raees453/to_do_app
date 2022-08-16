import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sqf;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static const String _createTableQuery =
      'CREATE TABLE events(id TEXT PRIMARY KEY, title TEXT, date INTEGER, category TEXT, subEvents TEXT);';

  static Future<Database> getDatabase() async {
    final dbPath = await sqf.getDatabasesPath();
    return sqf.openDatabase(
      path.join(dbPath, 'events.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(_createTableQuery);
      },
    );
  }

  static Future<void> insert(
    String table,
    Map<String, dynamic> data,
  ) async {
    final database = await DBHelper.getDatabase();
    database.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> fetchData(String table) async {
    final db = await DBHelper.getDatabase();
    return db.query(table);
  }
}
