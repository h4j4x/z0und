import 'package:flutter/material.dart';

import 'pages/audio_player.dart';
import 'pages/settings.dart';

class Routes {
  static const audioPlayer = '/audio-player';
  static const settings = '/settings';

  static final map = <String, WidgetBuilder>{
    audioPlayer: (_) => const AudioPlayerPage(),
    settings: (_) => const SettingsPage(),
  };
}
