import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'audio_source.dart';
import 'audio_track.dart';
import 'number_utils.dart';
import 'play_state.dart';

class PlayerWidget extends StatefulWidget {
  final AudioTrack track;

  const PlayerWidget({
    super.key,
    required this.track,
  });

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  static const paddingSize = 22.0;
  static const coverScale = 0.75;
  static const bigTextScaleFactor = 2.8;
  static const bigTextLetterSpacing = 0.2;
  static const mediumTextScaleFactor = 1.3;
  static const mediumTextLetterSpacing = 0.3;
  static const smallTextScaleFactor = 0.85;
  static const smallTextLetterSpacing = 0.8;

  final playState = PlayState();
  final player = AudioPlayer();
  String? error;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, setupTrack);
  }

  void setupTrack() async {
    final trackSource = AudioTrackSource(widget.track);
    error = null;
    try {
      await player.setAudioSource(trackSource);
      playState.duration = await player.durationFuture;
      player.playerStateStream.listen((state) {
        playState.playing = state.playing;
        switch (state.processingState) {
          case ProcessingState.ready:
            {
              playState.canPlay = true;
            }
        }
        setState(() {});
      });
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
    } else if (playState.duration == null) {
      content = loadingContent();
    } else {
      content = playerContent();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: paddingSize,
        horizontal: paddingSize * 1.2,
      ),
      child: Center(child: content),
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
          playState.duration!.inSeconds.toDouble().secondsFormatted(),
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
          onPressed: playState.canPlay ? onPlay : null,
          icon: Icon(
            playState.playing ? Icons.pause_sharp : Icons.play_arrow_sharp,
          ),
        ),
      ],
    );
  }

  void onPlay() {
    if (playState.playing) {
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
