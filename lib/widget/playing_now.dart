import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../helper/duration.dart';
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
    final playingNow = audioPlayer.playingNow!;
    final isLoading = audioPlayer.loadingAudio != null;
    return Material(
      elevation: 8.0,
      child: Container(
        color: Theme.of(context).dialogBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(playingNow.audioMeta.name),
                    subtitle: Text(playingNow.audioMeta.handlerId),
                  ),
                ),
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
            if (audioPlayer.playingPosition != null &&
                playingNow.audioMeta.durationInSeconds != null)
              ..._positionIndicator(
                audioPlayer.playingPosition!,
                Duration(seconds: playingNow.audioMeta.durationInSeconds!),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _positionIndicator(Duration position, Duration duration) {
    final positionPercent =
        position.inSeconds.toDouble() / duration.inSeconds.toDouble();
    return [
      LinearProgressIndicator(value: positionPercent),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 4.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              position.minutesFormatted(),
              textScaleFactor: 0.65,
            ),
            Text(
              duration.minutesFormatted(),
              textScaleFactor: 0.65,
            ),
          ],
        ),
      ),
    ];
  }
}
