part of 'aveostorage.dart';

class SecurePref {
  SecurePref._();

  /// In case the developer does not explicitly call the [init()] function.
  // bool _initCalled = false;

  final storage = const FlutterSecureStorage();

  // Write value
  store(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  // Read value
  Future<String> read(String key) async {
    return await storage.read(key: key) ?? "";
  }

  // Delete value
  deleteValue(String key) async {
    await storage.delete(key: key);
  }

  // Read values
  Future<Map<String, String>> readAllValues(String key) async {
    Map<String, String> allValues = await storage.readAll();
    return allValues;
  }

  // Delete all
  deleteAllPrefs() async {
    await storage.deleteAll();
  }
}
