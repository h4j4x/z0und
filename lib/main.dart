import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/pages/audio_player_page.dart';
import 'app/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppTheme()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    return MaterialApp(
      title: 'Z0und',
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: appTheme.themeMode,
      home: const AudioPlayerPage(),
    );
  }
}
