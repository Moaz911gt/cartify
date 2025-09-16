import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Sqldb {
  static Database? _db;

  static Future<Database?> get db async {
    if (_db == null) {
      return _db = await initialdb();
    } else {
      return _db;
    }
  }

  static initialdb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'store.db');
    Database mydb = await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onUpgrade: _onUpgarde,
    );
    return mydb;
  }

  static _onUpgarde(Database database, int oldVersion, int newVersion) {}

  static _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "cart"(
    "product_id" INTEGER PRIMARY KEY AUTOINCREMENT, 
    "Pname" TEXT NOT NULL,
    "Pimg" TEXT NOT NULL,
    "Pprice" TEXT NOT NULL,
    "Pquantity" TEXT NOT NULL
    )
''');
  }

  static readData(String sql) async {
    Database? mydb = await db;
    List<Map>? response = await mydb?.rawQuery(sql);
    return response;
  }

  static deleteData(String sql) async {
    Database? mydb = await db;
    int? response = await mydb?.rawDelete(sql);
    return response;
  }

  static updateData(String sql) async {
    Database? mydb = await db;
    int? response = await mydb?.rawUpdate(sql);
    return response;
  }

  static insertData(String sql, List<Object?> params) async {
    Database? mydb = await db;
    int? response = await mydb?.rawInsert(sql, params);
    return response;
  }

  static myDeleteDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'store.db');
    return deleteDatabase(path);
  }
}
