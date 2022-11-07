import 'dart:io';

import 'package:kitty/models/category_model.dart';
import 'package:kitty/models/report_model.dart';
import 'package:kitty/models/summary_model.dart';
import 'package:kitty/models/transaction.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataHelper {
  static final DataHelper db = DataHelper();
  Database? _dataBase;
  Database? _dataBaseCat;

  Future<Database> get dataBase async {
    if (_dataBase != null) return _dataBase!;
    _dataBase = await initDB();
    return _dataBase!;
  }

  Future<Database> get dataBaseCat async {
    if (_dataBaseCat != null) return _dataBaseCat!;
    _dataBaseCat = await initDBCategory();
    return _dataBaseCat!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, 'KittyDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE KITTY ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'title TEXT,'
          'amount INTEGER,'
          'type TEXT,'
          'categoryIcon TEXT,'
          'categoryName TEXT,'
          'categoryColor INTEGER'
          ')');
    });
  }

  Future<Database> initDBCategory() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, 'KittyDBCategory.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE CATEGORY ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'categoryName TEXT,'
          'categoryIcon TEXT,'
          'colorIcon INTEGER'
          ')');
    });
  }

  Future<int> addTranscaction(TransactionModel kitty) async {
    final db = await dataBase;
    var raw = await db.rawInsert(
      'INSERT Into KITTY (id, title, amount, type, categoryIcon, categoryName, categoryColor )'
      'VALUES (?,?,?,?,?,?,?)',
      [
        kitty.id,
        kitty.title,
        kitty.amount,
        kitty.type,
        kitty.categoryIcon,
        kitty.categoryName,
        kitty.categoryColor,
      ],
    );
    return raw;
  }

  Future<int> addCategory(CategoryModel categoryModel) async {
    final db = await dataBaseCat;
    var result = await db.rawInsert(
      'INSERT Into CATEGORY (id, categoryName, categoryIcon, colorIcon )'
      'VALUES (?,?,?,?)',
      [
        categoryModel.id,
        categoryModel.category,
        categoryModel.icon,
        categoryModel.color,
      ],
    );
    return result;
  }

  Future<List<SummaryModel>> income() async {
    final db = await dataBase;
    var result = await db.rawQuery(
        'SELECT SUM(amount) AS TOTALINC FROM KITTY WHERE Type = "Income"');

    return result.map((e) => SummaryModel.fromMap(e)).toList();
  }

  Future<List<SummaryModel>> expense() async {
    final db = await dataBase;
    var resultExp = await db.rawQuery(
        'SELECT SUM(amount) AS TOTALEXP FROM KITTY WHERE Type = "Expensive" ');

    return resultExp.map((e) => SummaryModel.fromMap(e)).toList();
  }

  Future<List<ReportModel>> report() async {
    final db = await dataBase;
    var report = await db.rawQuery(
        'SELECT *,COUNT(amount) AS agrs FROM KITTY GROUP BY categoryName');
    return report.map((e) => ReportModel.fromMap(e)).toList();
  }

  Future<List<TransactionModel>> getAlltrasaction() async {
    final db = await dataBase;
    var res = await db.query('KITTY');
    List<TransactionModel> list =
        res.map((e) => TransactionModel.fromMap(e)).toList();
    return list;
  }

  Future<List<CategoryModel>> getAllCategory() async {
    final db = await dataBaseCat;
    var cat = await db.query('CATEGORY');
    List<CategoryModel> listCategory =
        cat.map((e) => CategoryModel.fromMap(e)).toList();
    return listCategory;
  }
}
