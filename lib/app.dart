import 'package:flutter/material.dart';

import 'page/audio_list.dart';
import 'theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'z0und', // todo
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system, // todo: settings provider
      home: const AudioListPage(),
    );
  }
}
