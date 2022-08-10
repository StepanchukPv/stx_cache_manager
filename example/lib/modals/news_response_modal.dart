import 'package:example/modals/news_modal.dart';

class NewsResponseModal {
  NewsResponseModal({
    required this.items,
    required this.offset,
  });

  final List<NewsModal> items;
  final int offset;

  factory NewsResponseModal.fromJson(Map<String, dynamic> json) {
    return NewsResponseModal(
      offset: json['offset'],
      items: (json['items'] as List)
          .map(
            (e) => NewsModal.fromJson(e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
      'offset': offset,
    };
  }
}
