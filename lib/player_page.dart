import 'package:flutter/material.dart';

import 'audio_track.dart';
import 'file_reader.dart';
import 'player_widget.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z0und'),
        elevation: 0.0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SafeArea(
        child: PlayerWidget(
          track: AudioTrack(
            fileSource: FileSource.asset,
            filePath: 'assets/sample-audio-track.mp3',
          ),
        ),
      ),
    );
  }
}
