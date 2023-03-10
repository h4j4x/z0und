import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../helper/duration.dart';
import '../model/audio_meta.dart';
import '../service/audio_player.dart';

const iconPadding = 2.0;

class AudioListItemWidget extends StatelessWidget {
  final AudioMeta audioMeta;

  const AudioListItemWidget({
    super.key,
    required this.audioMeta,
  });

  @override
  Widget build(BuildContext context) {
    final playingAudio = AudioPlayer.of(context).playingNow;
    final playerIsLoading = playingAudio?.isLoading == true;
    final isActive = playingAudio?.audioMeta == audioMeta;
    final isLoading = isActive && playerIsLoading;
    final isPlaying = isActive && playingAudio?.isPlaying == true;
    final isPaused = isActive && playingAudio?.isPaused == true;
    const iconWidth = 10.0;
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
          if (isLoading)
            _leadingIcon(const SizedBox(
              width: iconWidth,
              height: iconWidth,
              child: CircularProgressIndicator.adaptive(),
            )),
          if (isPlaying)
            _leadingIcon(LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: iconWidth,
            )),
          if (isPaused)
            _leadingIcon(LoadingAnimationWidget.waveDots(
              color: Theme.of(context).primaryColor,
              size: iconWidth,
            )),
          if (!isActive) Container(width: iconWidth + iconPadding * 2),
          Expanded(
            child: ListTile(
              title: Text(audioMeta.name),
              subtitle: Text(audioMeta.handlerId),
              trailing: (audioMeta.durationInSeconds != null)
                  ? Text(Duration(seconds: audioMeta.durationInSeconds!)
                      .minutesFormatted())
                  : null,
            ),
          ),
          IconButton(
            onPressed: !playerIsLoading
                ? () {
                    final player = AudioPlayer.of(context, listen: false);
                    if (isPlaying) {
                      player.pause();
                    } else {
                      player.play(audioMeta);
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
        padding: const EdgeInsets.symmetric(horizontal: iconPadding),
        child: icon,
      );
}
