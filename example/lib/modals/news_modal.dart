class NewsModal {
  NewsModal({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  factory NewsModal.fromJson(Map<String, dynamic> json) {
    return NewsModal(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
