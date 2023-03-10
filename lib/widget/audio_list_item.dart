import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    final playingAudio = AudioPlayer.of(context).playingNow;
    final playerIsLoading = playingAudio?.isLoading == true;
    final isActive = playingAudio?.audioMeta == audioMeta;
    final isLoading = isActive && playerIsLoading;
    final isPlaying = isActive && playingAudio?.isPlaying == true;
    final isPaused = isActive && playingAudio?.isPaused == true;
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
              width: 16.0,
              height: 16.0,
              child: CircularProgressIndicator.adaptive(),
            )),
          if (isPlaying)
            _leadingIcon(LoadingAnimationWidget.staggeredDotsWave(
              color: Theme.of(context).primaryColor,
              size: 16.0,
            )),
          if (isPaused)
            _leadingIcon(LoadingAnimationWidget.waveDots(
              color: Theme.of(context).primaryColor,
              size: 16.0,
            )),
          if (!isActive) Container(width: 26.0),
          Expanded(
            child: ListTile(
              title: Text(audioMeta.name),
              subtitle: Text(audioMeta.handlerId),
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
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: icon,
      );
}
