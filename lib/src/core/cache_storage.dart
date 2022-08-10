abstract class CacheStorage<T> {
  Future<T?> read(String valueKey);

  Future<void> write({
    required String valueKey,
    required T value,
  });

  Future<void> delete(String valueKey);

  Future<void> clear();
}
