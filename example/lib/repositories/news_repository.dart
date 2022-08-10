import 'dart:developer';

import 'package:example/modals/news_modal.dart';
import 'package:example/modals/news_response_modal.dart';

class NewsRepository {
  Future<NewsResponseModal> getNews() async {
    log('Request....');

    await Future.delayed(const Duration(seconds: 1));

    final news = List.generate(20, (index) {
      return NewsModal(
        title: 'New Flutter Update',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean molestie dictum nisi ac vestibulum. Sed facilisis urna sagittis porta pulvinar. Nulla facilisi. Mauris hendrerit nunc at erat ullamcorper luctus. Praesent cursus molestie mi. Nunc tincidunt orci eget maximus blandit. Vivamus ac mauris sed libero scelerisque facilisis eu et nibh. Suspendisse luctus est quis lacus mollis, eu lacinia est pellentesque. Nulla id ante eget tellus dignissim fermentum. Cras ultrices sem eu volutpat aliquet. In vitae nibh tortor.',
      );
    });

    return NewsResponseModal(items: news, offset: 20);
  }
}
