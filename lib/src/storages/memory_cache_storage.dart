import 'package:stx_cache_manager/src/core/cache_storage.dart';

class MemoryCacheStorage<T> implements CacheStorage<T> {
  final _map = <String, T>{};

  @override
  Future<void> delete(String valueKey) async {
    _map.remove(valueKey);
  }

  @override
  Future<T?> read(String valueKey) async {
    return _map[valueKey];
  }

  @override
  Future<void> write({
    required String valueKey,
    required T value,
  }) async {
    _map[valueKey] = value;
  }

  @override
  Future<void> clear() async {
    _map.clear();
  }
}
