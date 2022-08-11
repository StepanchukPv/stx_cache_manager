import 'package:hive_flutter/hive_flutter.dart';
import 'package:stx_cache_manager/src/core/cache_storage.dart';

class HiveCacheStorage implements CacheStorage<String> {
  HiveCacheStorage({
    required this.boxName,
  }) : _box = Hive.box<String>(boxName);

  final Box<String> _box;

  final String boxName;

  static Future<void> initHiveBoxes({
    required List<String> boxNames,
  }) async {
    await Hive.initFlutter();

    for (int i = 0; i < boxNames.length; i++) {
      await Hive.openBox<String>(boxNames[i]);
    }
  }

  @override
  Future<String?> read(String valueKey) async {
    return _box.get(valueKey);
  }

  @override
  Future<void> write({
    required String valueKey,
    required String value,
  }) {
    return _box.put(valueKey, value);
  }

  @override
  Future<void> delete(String valueKey) {
    return _box.delete(valueKey);
  }

  @override
  Future<void> clear() {
    return _box.clear();
  }
}
