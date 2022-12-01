import 'package:flutter/material.dart';

import '../../common/model/audio_track.dart';
import '../../feature/audio/widget/audio_player.dart';
import '../constants.dart';
import '../l10n/app_l10n.g.dart';
import '../routes.dart';

class AudioPlayerPage extends StatelessWidget {
  const AudioPlayerPage({super.key});

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
        child: FutureBuilder<AudioTrack>(
          future: AudioTrack.fromAsset(sampleAudioAssetPath),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return AudioPlayerWidget(track: snapshot.data!);
            }
            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  }
}
