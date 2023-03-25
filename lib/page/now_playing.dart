import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_l10n.dart';

import '../helper/duration.dart';
import '../model/audio_meta.dart';
import '../service/audio_player.dart';
import '../widget/message_options.dart';

class NowPlayingPage extends StatefulWidget {
  const NowPlayingPage({super.key});

  @override
  State<StatefulWidget> createState() => _NowPlayingPageState();

  static Future<dynamic> pushRouteTo(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute<dynamic>(
      builder: (context) => const NowPlayingPage(),
    ));
  }
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer.of(context);
    if (audioPlayer.playingNow == null) {
      return emptyPlayer();
    }
    final playingNow = audioPlayer.playingNow!;
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(playingNow.title ?? l10n.playingNow),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          audioDescription(playingNow),
          if (audioPlayer.playingPosition != null &&
              playingNow.duration != null)
            ...positionIndicator(
                audioPlayer.playingPosition!, playingNow.duration!),
          audioControl(audioPlayer),
        ],
      ),
    );
  }

  Widget audioDescription(AudioMeta playingNow) {
    return ListTile(
      title: Text(playingNow.title ?? playingNow.name,
          textAlign: TextAlign.center),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(playingNow.artist ?? ''),
          ),
          Text(playingNow.handlerId),
        ],
      ),
    );
  }

  List<Widget> positionIndicator(Duration position, Duration duration) {
    final positionPercent =
        position.inSeconds.toDouble() / duration.inSeconds.toDouble();
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: LinearProgressIndicator(value: positionPercent),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 8.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              position.minutesFormatted(),
              textScaleFactor: 0.85,
            ),
            Text(
              duration.minutesFormatted(),
              textScaleFactor: 0.85,
            ),
          ],
        ),
      ),
    ];
  }

  Widget audioControl(AudioPlayer audioPlayer) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.loop_sharp),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.skip_previous_sharp),
          onPressed: !audioPlayer.isLoading
              ? () {
                  final audioPlayer = AudioPlayer.of(context, listen: false);
                  audioPlayer.playPrevious();
                }
              : null,
        ),
        IconButton(
          icon: audioPlayer.isPlaying
              ? const Icon(Icons.pause_circle_filled_sharp)
              : const Icon(Icons.play_circle_filled_sharp),
          onPressed: !audioPlayer.isLoading
              ? () {
                  final audioPlayer = AudioPlayer.of(context, listen: false);
                  if (audioPlayer.isPlaying) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer.resume();
                  }
                }
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.skip_next_sharp),
          onPressed: !audioPlayer.isLoading
              ? () {
                  final audioPlayer = AudioPlayer.of(context, listen: false);
                  audioPlayer.playNext();
                }
              : null,
        ),
        const Spacer(),
        const Icon(Icons.shuffle_sharp),
      ],
    );
  }

  Widget emptyPlayer() {
    final l10n = L10n.of(context);
    return MessageOptionsWidget(
      message: l10n.nothingHere,
      messageColor: Theme.of(context).colorScheme.error,
      options: [
        ListTile(
          leading: const Icon(Icons.arrow_back_sharp),
          title: Text(l10n.back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
