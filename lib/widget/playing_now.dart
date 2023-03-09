import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../service/audio_player.dart';

class PlayingNowWidget extends StatelessWidget {
  const PlayingNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer.of(context);
    if (audioPlayer.playingNow == null) {
      return Container(height: .0);
    }
    double? position;
    if (audioPlayer.playingNowPosition != null &&
        audioPlayer.playingNow!.durationInSeconds != null) {
      position = audioPlayer.playingNowPosition!.inSeconds.toDouble() /
          audioPlayer.playingNow!.durationInSeconds!.toDouble();
    }
    return Material(
      elevation: 8.0,
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).dialogBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(audioPlayer.playingNow!.name),
                    subtitle: Text(audioPlayer.playingNow!.handlerId),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).primaryColor,
                    size: 18.0,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next_sharp),
                  onPressed: () {
                    final audioPlayer = AudioPlayer.of(context, listen: false);
                    audioPlayer.playNext();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close_sharp),
                  onPressed: () {
                    final audioPlayer = AudioPlayer.of(context, listen: false);
                    audioPlayer.stop();
                  },
                ),
              ],
            ),
          ),
          if (position != null) LinearProgressIndicator(value: position),
        ],
      ),
    );
  }
}
