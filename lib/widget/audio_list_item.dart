import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../helper/duration.dart';
import '../model/audio_meta.dart';
import '../service/audio_player.dart';

const iconPadding = 3.0;

class AudioListItemWidget extends StatelessWidget {
  final AudioMeta audioMeta;
  final Function(AudioMeta) onPlay;

  const AudioListItemWidget({
    super.key,
    required this.audioMeta,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer.of(context);
    final isActive = audioPlayer.playingNow == audioMeta;
    final isLoading = isActive && audioPlayer.isLoading;
    final isPlaying = isActive && audioPlayer.isPlaying;
    final isPaused = isActive && audioPlayer.isPaused;
    const iconWidth = 10.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
          if (isLoading)
            _leadingIcon(
              LoadingAnimationWidget.dotsTriangle(
                color: Theme.of(context).primaryColor,
                size: iconWidth,
              ),
            ),
          if (isPlaying)
            _leadingIcon(
              LoadingAnimationWidget.staggeredDotsWave(
                color: Theme.of(context).primaryColor,
                size: iconWidth,
              ),
            ),
          if (isPaused)
            _leadingIcon(
              LoadingAnimationWidget.waveDots(
                color: Theme.of(context).primaryColor,
                size: iconWidth,
              ),
            ),
          if (!isActive) Container(width: iconWidth + (iconPadding * 3)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  audioMeta.name,
                  textScaleFactor: 1.1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: iconPadding),
                  child: Text(
                    audioMeta.handlerId,
                    textScaleFactor: 0.7,
                  ),
                ),
              ],
            ),
          ),
          if (audioMeta.durationInSeconds != null)
            Text(
              Duration(seconds: audioMeta.durationInSeconds!)
                  .minutesFormatted(),
              textScaleFactor: 0.8,
            ),
          IconButton(
            onPressed: (!audioPlayer.isLoading)
                ? () {
                    final player = AudioPlayer.of(context, listen: false);
                    if (isPlaying) {
                      player.pause();
                    } else {
                      onPlay(audioMeta);
                    }
                  }
                : null,
            icon: isPlaying
                ? const Icon(Icons.pause_circle_filled_sharp)
                : const Icon(Icons.play_circle_fill_sharp),
          ),
        ],
      ),
    );
  }

  Widget _leadingIcon(Widget icon) => Padding(
        padding: const EdgeInsets.only(
          left: iconPadding,
          right: iconPadding * 2,
        ),
        child: icon,
      );
}
