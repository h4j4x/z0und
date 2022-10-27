import 'package:flutter/material.dart';

import 'app/audio_player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Z0und',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const AudioPlayerPage(),
    );
  }
}
