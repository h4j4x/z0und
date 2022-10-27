import 'package:flutter/material.dart';

import '../../../common/util/number_utils.dart';
import '../../audio/model/audio_track.dart';
import '../data/audio_player.dart';
import '../data/just_audio_player.dart';
import '../model/audio_player_state.dart';

class AudioPlayerWidget extends StatefulWidget {
  final AudioTrack track;

  const AudioPlayerWidget({
    super.key,
    required this.track,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  static const maxWidth = 300.0;
  static const paddingSize = 22.0;
  static const coverScale = 0.75;
  static const bigTextScaleFactor = 2.8;
  static const bigTextLetterSpacing = 0.2;
  static const mediumTextScaleFactor = 1.3;
  static const mediumTextLetterSpacing = 0.3;
  static const smallTextScaleFactor = 0.85;
  static const smallTextLetterSpacing = 0.8;

  final playerState = AudioPlayerState();
  late AudioPlayer player;
  String? error;

  @override
  void initState() {
    super.initState();
    player = JustAudioPlayer(widget.track);
    Future.delayed(Duration.zero, setupPlayer);
  }

  void setupPlayer() async {
    player.addListener((state) {
      setState(() {
        playerState.merge(state);
      });
    });
    error = null;
    try {
      playerState.duration = await player.fetchDuration();
    } catch (e) {
      error = e.toString();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (error != null) {
      content = errorContent();
    } else if (playerState.duration == null) {
      content = loadingContent();
    } else {
      content = playerContent();
    }
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: maxWidth,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: paddingSize,
          horizontal: paddingSize * 1.2,
        ),
        child: Center(child: content),
      ),
    );
  }

  Widget playerContent() {
    return LayoutBuilder(builder: (context, constraints) {
      final coverSize = constraints.maxWidth * coverScale;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          trackCover(coverSize),
          Padding(
            padding: const EdgeInsets.only(top: paddingSize),
            child: trackTitle(),
          ),
          trackAlbum(),
          Padding(
            padding: const EdgeInsets.only(
              top: paddingSize * 1.5,
              left: paddingSize,
              right: paddingSize,
            ),
            child: trackTimes(),
          ),
          trackProgress(),
          trackControls(),
        ],
      );
    });
  }

  Widget trackCover(double size) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  Widget trackTitle() {
    return Text(
      'Track Title TODO'.toUpperCase(),
      textAlign: TextAlign.center,
      textScaleFactor: bigTextScaleFactor,
      style: TextStyle(
        fontWeight: FontWeight.w900,
        letterSpacing: bigTextLetterSpacing,
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }

  Widget trackAlbum() {
    return Text(
      'Track Album TODO'.toUpperCase(),
      textAlign: TextAlign.center,
      textScaleFactor: mediumTextScaleFactor,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: mediumTextLetterSpacing,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget trackTimes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'TODO', // todo
          textScaleFactor: smallTextScaleFactor,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Text(
          playerState.duration!.inSeconds.toDouble().secondsFormatted(),
          textScaleFactor: smallTextScaleFactor,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  Widget trackProgress() {
    return Slider(
      value: 0.0, // todo
      onChanged: (value) {
        // setState(() {
        //   progressValue = value;
        // });
      },
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget trackControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: playerState.canPlay ? onPlay : null,
          icon: Icon(
            playerState.playing ? Icons.pause_sharp : Icons.play_arrow_sharp,
          ),
        ),
      ],
    );
  }

  void onPlay() {
    if (playerState.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  Widget errorContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          error!,
          textAlign: TextAlign.center,
          textScaleFactor: mediumTextScaleFactor,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: mediumTextLetterSpacing,
            color: Theme.of(context).errorColor,
          ),
        ),
      ],
    );
  }

  Widget loadingContent() {
    return const CircularProgressIndicator.adaptive();
  }
}
