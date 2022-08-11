import 'dart:developer';

import 'package:example/modals/news_response_modal.dart';
import 'package:example/repositories/news_repository.dart';
import 'package:example/services/news_cache_manager.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<NewsResponseModal> _getData() async {
    final newsCache = NewsCacheManager();

    final hiveData = await newsCache.read();

    if (hiveData == null) {
      final response = await NewsRepository().getNews();
      newsCache.write(response);
      return response;
    }

    log('Cached data returned !!!');
    return hiveData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await NewsCacheManager().clear();
          log('Cache cleared');
        },
        child: const Icon(
          Icons.delete_forever,
        ),
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (_, AsyncSnapshot<NewsResponseModal> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data!.items.length,
            separatorBuilder: (_, __) {
              return const SizedBox(height: 8.0);
            },
            itemBuilder: (_, index) {
              final item = snapshot.data!.items[index];

              return ListTile(
                leading: const FlutterLogo(
                  size: 48,
                ),
                title: Text(item.title),
                subtitle: Text(item.description),
              );
            },
          );
        },
      ),
    );
  }
}
