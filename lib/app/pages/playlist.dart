import 'package:flutter/material.dart';

import '../../common/model/file_source.dart';
import '../../feature/audio/model/audio_track.dart';
import '../../feature/playlist/widget/playlist.dart';
import '../l10n/app_l10n.g.dart';
import '../routes.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).appTitle),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.settings);
            },
            icon: const Icon(Icons.settings_sharp),
          ),
        ],
      ),
      body: SafeArea(
        child: PlaylistWidget(
          list: [
            AudioTrack(
              fileSource: FileSource.asset,
              filePath: 'assets/sample-audio-track.mp3',
            ),
          ],
        ),
      ),
    );
  }
}
