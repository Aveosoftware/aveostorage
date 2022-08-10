part of 'aveostorage.dart';

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

  Future insertValue(String tableName, Map<String, Object?> values) async {
    await _database!.transaction((txn) async {
      txn.insert(tableName, values);
    });
  }

  Future<List<Map<String, Object?>>> query(String tableName, String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
    List<Map<String, Object?>> data = [];
    await _database!.transaction((txn) async {
      data = await txn.query(tableName,
          columns: columns,
          distinct: distinct,
          groupBy: groupBy,
          having: having,
          limit: limit,
          offset: offset,
          orderBy: orderBy,
          where: where,
          whereArgs: whereArgs);
    });
    return data;
  }

  Future updateValue(
    String tableName,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await _database!.transaction((txn) async {
      txn.update(tableName, values, where: where, whereArgs: whereArgs);
    });
  }

  Future deleteValue(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    await _database!.transaction((txn) async {
      txn.delete(tableName, where: where, whereArgs: whereArgs);
    });
  }
}
