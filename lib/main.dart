import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/l10n/app_l10n.g.dart';
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
      // theme
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      themeMode: appTheme.themeMode,
      // localization
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      onGenerateTitle: (context) => L10n.of(context).appTitle,
      // route
      home: const AudioPlayerPage(),
    );
  }
}
