part of 'aveostorage.dart';

class SecurePref {

  /// In case the developer does not explicitly call the [init()] function.
  // bool _initCalled = false;

  static const _storage =  FlutterSecureStorage();

  // Write value
 static store(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read value
  static Future<String> read(String key) async {
    return await _storage.read(key: key) ?? "";
  }

  // Delete value
  static deleteValue(String key) async {
    await _storage.delete(key: key);
  }

  // Read values
  static Future<Map<String, String>> readAllValues(String key) async {
    Map<String, String> allValues = await _storage.readAll();
    return allValues;
  }

  // Delete all
  static deleteAllPrefs() async {
    await _storage.deleteAll();
  }
}
