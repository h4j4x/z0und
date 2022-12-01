import 'package:flutter/material.dart';

import '../../feature/audio/widget/audio_player.dart';
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
      body: const SafeArea(
        child: AudioPlayerWidget(),
      ),
    );
  }
}
