import 'package:flutter/material.dart';

import '../model/audio_meta.dart';
import '../service/audio_player.dart';

class AudioListItemWidget extends StatelessWidget {
  final AudioMeta audioMeta;

  const AudioListItemWidget({
    super.key,
    required this.audioMeta,
  });

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer.of(context);
    final isPlaying = audioPlayer.playingNow == audioMeta;
    final isLoading = audioPlayer.loadingNow == audioMeta;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            style: BorderStyle.solid,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isPlaying)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.notifications_active_sharp),
            ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: CircularProgressIndicator.adaptive(),
            ),
          Expanded(
            child: ListTile(
              title: Text(audioMeta.name),
              subtitle: Text(audioMeta.handlerId),
            ),
          ),
          IconButton(
            onPressed: (!isPlaying && audioPlayer.loadingNow == null)
                ? () {
                    final player = AudioPlayer.of(context, listen: false);
                    player.play(audioMeta);
                  }
                : null,
            icon: const Icon(Icons.play_circle_fill_sharp),
          ),
        ],
      ),
    );
  }
}
