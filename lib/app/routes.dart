import 'package:flutter/material.dart';

import 'pages/audio_player.dart';
import 'pages/playlist.dart';
import 'pages/settings.dart';

class Routes {
  static const playlist = '/playlist';
  static const audioPlayer = '/audio-player';
  static const settings = '/settings';

  static final map = <String, WidgetBuilder>{
    playlist: (_) => const PlaylistPage(),
    audioPlayer: (_) => const AudioPlayerPage(),
    settings: (_) => const SettingsPage(),
  };
}
