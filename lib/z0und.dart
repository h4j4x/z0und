import 'package:flutter/material.dart';

import 'page/music_list.dart';

class Z0undApp extends StatelessWidget {
  const Z0undApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'z0und',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MusicListPage(),
    );
  }
}
