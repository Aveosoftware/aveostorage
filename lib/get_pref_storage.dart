part of 'aveostorage.dart';

class GetPrefStorage {
  // GetPrefStorage();

  /// In case the developer does not explicitly call the [init()] function.
  bool _initCalled = false;

  void init({String containerName = 'aveostorage'}) {
    _initCalled = true;
    _box = GetStorage(containerName);
  }

  // Future<GetPrefStorage>
  late GetStorage _box;
  store(String key, dynamic value) {
    assert(_initCalled,
        "GetPrefStorage.init() must be called first in an initState() or main() preferably!");
    _box.write(key, value);
  }

  read(String key) {
    assert(_initCalled,
        "GetPrefStorage.init() must be called first in an initState() or main() preferably!");
    return _box.read(key) ?? "";
  }
}
