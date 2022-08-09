// ignore_for_file: constant_identifier_names, non_constant_identifier_names

enum RuntimeType { Int, String, Real }

// enum SqlKey {
//   Primary,
//   Unique,
//   NotNull,
// }
class SqlKey {
  static String get Primary => "PRIMARY KEY";
  static String get Unique => "UNIQUE";
  static String get NotNull => "NOT NULL";
  static String get None => "";
}

class ParameterModel {
  String paramName;
  RuntimeType runType;
  String sqlKey;
  ParameterModel(
      {required this.paramName, required this.runType, this.sqlKey = ""});
}
