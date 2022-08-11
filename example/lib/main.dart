import 'package:flutter/material.dart';
import 'package:stx_cache_manager/stx_cache_manager.dart';

import 'screens/home_screen.dart';

void main() async {
  await HiveCacheStorage.initHiveBoxes(
    boxNames: ['NewsBox'],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'stx_cache_manger',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
