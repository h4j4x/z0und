import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/util/file_reader.dart';
import '../../feature/audio/model/audio_track.dart';
import '../../feature/audio/widget/audio_player_widget.dart';
import '../theme.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z0und'),
        backgroundColor: Colors.transparent,
        actions: [
          _themeButton(context),
        ],
      ),
      body: SafeArea(
        child: AudioPlayerWidget(
          track: AudioTrack(
            fileSource: FileSource.asset,
            filePath: 'assets/sample-audio-track.mp3',
          ),
        ),
      ),
    );
  }

  Widget _themeButton(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    IconData icon;
    switch (appTheme.themeMode) {
      case ThemeMode.system:
        icon = Icons.brightness_auto_sharp;
        break;
      case ThemeMode.light:
        icon = Icons.light_mode_sharp;
        break;
      case ThemeMode.dark:
        icon = Icons.dark_mode_sharp;
        break;
    }
    return IconButton(
      onPressed: () => _onChangeThemeMode(context),
      icon: Icon(icon),
    );
  }

  void _onChangeThemeMode(BuildContext context) {
    final appTheme = context.read<AppTheme>();
    final modeIndex = ThemeMode.values.indexOf(appTheme.themeMode);
    final nextIndex = (modeIndex + 1) % ThemeMode.values.length;
    appTheme.themeMode = ThemeMode.values[nextIndex];
  }
}
