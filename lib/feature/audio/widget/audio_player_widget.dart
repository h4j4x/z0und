import 'package:flutter/material.dart';

import '../../../common/util/duration_utils.dart';
import '../../audio/model/audio_track.dart';
import '../model/audio_player_state.dart';
import '../use_case/audio_player.dart';
import '../use_case/just_audio_player.dart';

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
  static const maxWidth = 600.0;
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

  @override
  void initState() {
    super.initState();
    player = JustAudioPlayer(widget.track);
    Future.delayed(Duration.zero, setupPlayer);
  }

  void setupPlayer() async {
    playerState.error = null;
    try {
      playerState.duration = await player.fetchDuration();
    } catch (e) {
      playerState.error = e.toString(); // todo
    }
    setState(() {});
    player.stateStream().listen((state) {
      setState(() {
        playerState.merge(state);
      });
    });
    player.positionStream().listen((position) {
      setState(() {
        playerState.position = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (playerState.error != null) {
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
          Padding(
            padding: const EdgeInsets.only(top: paddingSize),
            child: trackControls(),
          ),
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
          playerState.position.minutesFormatted(),
          textScaleFactor: smallTextScaleFactor,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Text(
          playerState.duration!.minutesFormatted(),
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
      value: playerState.position.inSeconds.toDouble(),
      max: (playerState.duration ?? Duration.zero).inSeconds.toDouble(),
      onChanged: playerState.canPlay
          ? (value) {
              player.seek(Duration(seconds: value.toInt()));
            }
          : null,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }

  Widget trackControls() {
    const buttonSize = paddingSize * 2.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: buttonSize,
          backgroundColor: Theme.of(context).selectedRowColor,
          child: IconButton(
            onPressed: playerState.canPlay ? onPlay : null,
            color: Theme.of(context).primaryColor,
            icon: Icon(
              playerState.playing ? Icons.pause_sharp : Icons.play_arrow_sharp,
            ),
            iconSize: buttonSize,
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
          playerState.error!,
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
