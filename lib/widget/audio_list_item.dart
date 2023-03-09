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
          Expanded(
            child: ListTile(
              title: Text(audioMeta.name),
              subtitle: Text(audioMeta.handlerId),
            ),
          ),
          IconButton(
            onPressed: !isPlaying
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
