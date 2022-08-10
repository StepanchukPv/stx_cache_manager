import 'package:hive_flutter/hive_flutter.dart';
import 'package:stx_cache_manager/src/core/cache_storage.dart';

class HiveCacheStorage implements CacheStorage<String> {
  HiveCacheStorage() : _box = Hive.box<String>(_boxName);

  final Box<String> _box;

  static const String _boxName = 'CacheBox';

  static Future<void> intiStorage() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_boxName);
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
