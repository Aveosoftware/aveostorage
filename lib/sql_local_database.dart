import 'package:aveostorage/model/parameter_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlLocalDatabase {
  SqlLocalDatabase._();
  static final SqlLocalDatabase db = SqlLocalDatabase._();

  // single reference to the database throughout the app
  Database? _database;

  Future<Database> get database async {
    if (kDebugMode) {
      print('database getter called');
    }

    if (_database != null) {
      return _database!;
    }
    assert(_database == null,
        'SqlLocalDatabase.init() must be called first in an initState() preferably!');

    return _database!;
  }

  Future<Database> createDatabase(String databaseName) async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, '$databaseName.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        if (kDebugMode) {
          print('Database Has been Created');
        }
      },
    );
  }

  Future createTable(String tableName, List<ParameterModel> params) async {
    String createQuery = "CREATE TABLE $tableName (";
    for (var element in params) {
      if (element.runType == RuntimeType.Int) {
        createQuery += "${element.paramName} INTEGER ${element.sqlKey}";
      }
      if (element.runType == RuntimeType.String) {
        createQuery += "${element.paramName} TEXT ${element.sqlKey}";
      }
      if (element.runType == RuntimeType.Real) {
        createQuery += "${element.paramName} REAL ${element.sqlKey}";
      }
    }
    createQuery += ")";
    await _database!.rawQuery(createQuery);
  }

  Future insertValue(String tableName,) async {
    await _database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
      print('inserted1: $id1');
      int id2 = await txn.rawInsert(
          'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
          ['another name', 12345678, 3.1416]);
      print('inserted2: $id2');
    });
  }
}
