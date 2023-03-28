import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_l10n.dart';

import '../helper/duration.dart';
import '../model/audio_meta.dart';
import '../service/audio_player.dart';
import '../theme.dart';
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
    final hasPosition =
        audioPlayer.playingPosition != null && playingNow.duration != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(playingNow.title ?? l10n.playingNow),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        children: [
          audioDescription(playingNow),
          const SizedBox(height: 20.0),
          if (hasPosition)
            ...positionIndicator(
                audioPlayer.playingPosition!, playingNow.duration!),
          if (hasPosition) const SizedBox(height: 20.0),
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
          if (playingNow.artist?.isNotEmpty == true)
            Expanded(
              child: Text(playingNow.artist!),
            ),
          Text(playingNow.handlerId),
        ],
      ),
    );
  }

  List<Widget> positionIndicator(Duration position, Duration duration) {
    return [
      Slider.adaptive(
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (value) => AudioPlayer.of(context, listen: false)
            .seek(Duration(seconds: value.toInt())),
        semanticFormatterCallback: (value) =>
            Duration(seconds: value.toInt()).minutesFormatted(),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
    const skipIconSize = 40.0;
    const playIconSize = skipIconSize * 1.8;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(
            Icons.loop_sharp,
            color:
                audioPlayer.loop ? Theme.of(context).colorScheme.success : null,
          ),
          onPressed: !audioPlayer.isLoading
              ? () => AudioPlayer.of(context, listen: false).toggleLoop()
              : null,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.skip_previous_sharp),
          iconSize: skipIconSize,
          onPressed: !audioPlayer.isLoading
              ? () => AudioPlayer.of(context, listen: false).playPrevious()
              : null,
        ),
        IconButton(
          icon: audioPlayer.isPlaying
              ? const Icon(Icons.pause_circle_filled_sharp)
              : const Icon(Icons.play_circle_filled_sharp),
          iconSize: playIconSize,
          onPressed: !audioPlayer.isLoading
              ? () => AudioPlayer.of(context, listen: false).togglePlay()
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.skip_next_sharp),
          iconSize: skipIconSize,
          onPressed: !audioPlayer.isLoading
              ? () => AudioPlayer.of(context, listen: false).playNext()
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
