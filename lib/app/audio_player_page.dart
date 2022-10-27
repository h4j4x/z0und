import 'package:flutter/material.dart';

import '../common/util/file_reader.dart';
import '../feature/audio/model/audio_track.dart';
import '../feature/audio/widget/audio_player_widget.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).backgroundColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z0und'),
        elevation: 0.0,
        backgroundColor: bgColor,
      ),
      backgroundColor: bgColor,
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
}
