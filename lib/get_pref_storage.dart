part of 'aveostorage.dart';

class GetPrefStorage {
  GetPrefStorage._();
  GetPrefStorage instance = GetPrefStorage._();

  /// In case the developer does not explicitly call the [init()] function.
  bool _initCalled = false;

  GetPrefStorage init({String containerName = 'aveostorage'}) {
    _initCalled = true;
    box = GetStorage(containerName);
    return instance;
  }

  // Future<GetPrefStorage>
  late GetStorage box;
  store(String key, dynamic value) {
    assert(_initCalled,
        "GetPrefStorage.init() must be called first in an initState() or main() preferably!");
    box.write(key, value);
  }

  read(String key) {
    assert(_initCalled,
        "GetPrefStorage.init() must be called first in an initState() or main() preferably!");
    return box.read(key);
  }
}
