import 'dart:convert';

import 'package:example/modals/news_response_modal.dart';
import 'package:stx_cache_manager/stx_cache_manager.dart';

class NewsCacheManager {
  final HiveCacheStorage _storage = HiveCacheStorage();
  final String _accessKey = 'newsResponse';

  Future<NewsResponseModal?> read() async {
    final data = await _storage.read(_accessKey);

    if (data == null) {
      return null;
    }

    final json = jsonDecode(data);

    return NewsResponseModal.fromJson(json);
  }

  Future<void> write(NewsResponseModal value) {
    final String data = jsonEncode(value.toJson());

    return _storage.write(
      valueKey: _accessKey,
      value: data,
    );
  }

  Future<void> clear() {
    return _storage.clear();
  }
}
