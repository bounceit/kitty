import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Future<Database?> initializeDatabase() async =>
      await openDatabase(join(await getDatabasesPath(), 'Kitty'),
          version: 1,
          onCreate: (Database db, int version) => onCreate(db, version));

  onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE Kitty('
      'id INTEGER PRIMARY KEY,'
      'title TEXT,'
      'description TEXT,'
      'amount TEXT,'
      'isIncome INTEGER,'
      'category TEXT,'
      ');',
    );
  }

  Future<void> insertData(String tableName, Map<String, Object?> data) async {
    final db = await initializeDatabase();
    await db!.insert(tableName, data);
  }

  Future<void> updateData(
      String tableName, Map<String, Object?> data, int id) async {
    final db = await initializeDatabase();
    await db!.update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteData(String tableName, int id) async {
    final db = await initializeDatabase();
    await db!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getData(String tableName) async {
    final db = await initializeDatabase();
    return await db!.query(tableName, orderBy: "dateTime DESC");
  }
}
