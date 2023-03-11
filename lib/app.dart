import 'package:flutter/material.dart';

import 'page/audio_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'z0und', // todo
      theme: ThemeData(primarySwatch: Colors.blue), // todo
      home: const AudioListPage(),
    );
  }
}
