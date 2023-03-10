import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../model/playing_audio.dart';
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
    final playingNow = audioPlayer.playingNow!;
    if (playingNow.audioMeta.durationInSeconds != null &&
        audioPlayer.playingPosition != null) {
      position = audioPlayer.playingPosition!.inSeconds.toDouble() /
          playingNow.audioMeta.durationInSeconds!.toDouble();
    }
    final isLoading = playingNow.isLoading;
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
                    title: Text(playingNow.audioMeta.name),
                    subtitle: Text(playingNow.audioMeta.handlerId),
                  ),
                ),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                      width: 18.0,
                      height: 18.0,
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ),
                if (!isLoading)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: playingNow.state == PlayingState.playing
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Theme.of(context).primaryColor,
                            size: 18.0,
                          )
                        : LoadingAnimationWidget.waveDots(
                            color: Theme.of(context).primaryColor,
                            size: 18.0,
                          ),
                  ),
                IconButton(
                  icon: playingNow.state == PlayingState.playing
                      ? const Icon(Icons.pause_circle_filled_sharp)
                      : const Icon(Icons.play_circle_filled_sharp),
                  onPressed: !isLoading
                      ? () {
                          final audioPlayer =
                              AudioPlayer.of(context, listen: false);
                          if (playingNow.state == PlayingState.playing) {
                            audioPlayer.pause();
                          } else {
                            audioPlayer.resume();
                          }
                        }
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next_sharp),
                  onPressed: !isLoading
                      ? () {
                          final audioPlayer =
                              AudioPlayer.of(context, listen: false);
                          audioPlayer.playNext();
                        }
                      : null,
                ),
                IconButton(
                  icon: const Icon(Icons.close_sharp),
                  onPressed: !isLoading
                      ? () {
                          final audioPlayer =
                              AudioPlayer.of(context, listen: false);
                          audioPlayer.stop();
                        }
                      : null,
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
