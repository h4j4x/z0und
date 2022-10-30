import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../../common/util/duration_utils.dart';
import '../../audio/model/audio_track.dart';
import '../model/audio_metadata.dart';
import '../model/audio_player_state.dart';
import '../use_case/audio_meta_fetcher.dart';
import '../use_case/audio_player.dart';

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
  static const bigTextScaleFactor = 2.0;
  static const bigTextLetterSpacing = 0.2;
  static const mediumTextScaleFactor = 1.2;
  static const mediumTextLetterSpacing = 0.3;
  static const smallTextScaleFactor = 0.85;
  static const smallTextLetterSpacing = 0.8;

  var playerState = AudioPlayerState();
  AudioMetadata? metadata;
  late AudioPlayer player;
  StreamSubscription<AudioPlayerState>? stateSubscription;

  get primaryColor => Theme.of(context).colorScheme.primaryContainer;

  get secondaryColor => Theme.of(context).colorScheme.secondaryContainer;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer.create(widget.track);
    Future.delayed(Duration.zero, () {
      setupPlayer();
      fetchMetadata();
    });
  }

  void setupPlayer() async {
    stateSubscription = player.stateStream.listen((state) {
      setState(() {
        playerState = state;
      });
    });
  }

  void fetchMetadata() async {
    final fetcher = AudioMetaFetcher.create(widget.track);
    metadata = await fetcher.metadata;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (playerState.error != null) {
      content = errorContent();
    } else if (playerState.loading) {
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
          horizontal: paddingSize * 1.2,
        ),
        child: Center(child: content),
      ),
    );
  }

  Widget playerContent() {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          trackCard(constraints),
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
            padding: const EdgeInsets.symmetric(vertical: paddingSize),
            child: trackControls(),
          ),
          volumeControls(),
        ],
      );
    });
  }

  Widget trackCard(BoxConstraints constraints) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: paddingSize,
      child: Padding(
        padding: const EdgeInsets.all(paddingSize * 0.65),
        child: Column(
          children: [
            trackCover(constraints),
            Padding(
              padding: const EdgeInsets.only(top: paddingSize * 0.8),
              child: trackTitle(),
            ),
            trackAlbum(),
          ],
        ),
      ),
    );
  }

  Widget trackCover(BoxConstraints constraints) {
    double size =
        min(constraints.maxWidth * 0.75, constraints.maxHeight * 0.25);
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget trackTitle() {
    String title = metadata?.title ?? widget.track.filePath;
    return Text(
      title.toUpperCase(),
      textAlign: TextAlign.center,
      textScaleFactor: bigTextScaleFactor,
      style: const TextStyle(
        fontWeight: FontWeight.w900,
        letterSpacing: bigTextLetterSpacing,
      ),
    );
  }

  Widget trackAlbum() {
    String album = metadata?.album ?? '-';
    return Text(
      album.toUpperCase(),
      textAlign: TextAlign.center,
      textScaleFactor: mediumTextScaleFactor,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: mediumTextLetterSpacing,
        color: secondaryColor,
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
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
          ),
        ),
        Text(
          playerState.duration.minutesFormatted(),
          textScaleFactor: smallTextScaleFactor,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
          ),
        ),
      ],
    );
  }

  Widget trackProgress() {
    return Slider(
      value: playerState.position.inSeconds.toDouble(),
      max: playerState.duration.inSeconds.toDouble(),
      onChanged: playerState.canPlay
          ? (value) {
              player.seek(Duration(seconds: value.toInt()));
            }
          : null,
    );
  }

  Widget trackControls() {
    const buttonSize = paddingSize * 2.0;
    IconData icon;
    if (playerState.done) {
      icon = Icons.replay_sharp;
    } else if (playerState.playing) {
      icon = Icons.pause_sharp;
    } else {
      icon = Icons.play_arrow_sharp;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: playerState.canPlay ? onPlay : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            elevation: paddingSize,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonSize / 2),
            ),
          ),
          child: Icon(
            icon,
            size: buttonSize * 0.65,
            color: Theme.of(context).hintColor,
          ),
        ),
      ],
    );
  }

  void onPlay() async {
    if (playerState.done) {
      await player.seek(Duration.zero);
    }

    if (playerState.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  Widget volumeControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.volume_down_sharp),
        Slider(
          value: playerState.volume,
          onChanged: playerState.canPlay
              ? (value) {
                  player.setVolume(value);
                }
              : null,
          activeColor: secondaryColor,
        ),
        const Icon(Icons.volume_up_sharp),
      ],
    );
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

  @override
  void dispose() {
    stateSubscription?.cancel();
    player.dispose();
    super.dispose();
  }
}
