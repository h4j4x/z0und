import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/l10n/app_l10n.g.dart';
import '../../../common/state/playing_audio.dart';
import '../../../common/util/duration_utils.dart';
import '../../audio/model/audio_track.dart';
import '../use_case/audio_waver.dart';
import 'audio_wave.dart';

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

  late AudioWaver waver;
  var lastVolume = 0.0;

  Color get primaryColor => Theme.of(context).colorScheme.primaryContainer;

  Color get secondaryColor => Theme.of(context).colorScheme.secondaryContainer;

  bool audioIsMuted(PlayingAudio playingAudio) {
    return playingAudio.state.volume < 0.01;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      waver = AudioWaver.create(widget.track);
      final playingAudio = context.read<PlayingAudio>();
      playingAudio.play(track: widget.track);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayingAudio>(builder: (context, playingAudio, _) {
      Widget content;
      if (playingAudio.state.error != null) {
        content = errorContent(playingAudio.state.error!);
      } else if (playingAudio.state.loading) {
        content = loadingContent();
      } else {
        content = playerContent(playingAudio);
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
    });
  }

  Widget playerContent(PlayingAudio playingAudio) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          trackCard(constraints, playingAudio),
          Padding(
            padding: const EdgeInsets.only(
              top: paddingSize * 1.5,
              left: paddingSize,
              right: paddingSize,
            ),
            child: trackTimes(playingAudio),
          ),
          trackProgress(playingAudio),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: paddingSize),
            child: trackControls(playingAudio),
          ),
          volumeControls(playingAudio),
        ],
      );
    });
  }

  Widget trackCard(BoxConstraints constraints, PlayingAudio playingAudio) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: paddingSize,
      child: Padding(
        padding: const EdgeInsets.all(paddingSize * 0.65),
        child: Column(
          children: [
            trackCover(constraints, playingAudio),
            Padding(
              padding: const EdgeInsets.only(top: paddingSize * 0.8),
              child: trackTitle(playingAudio),
            ),
            trackAlbum(playingAudio),
          ],
        ),
      ),
    );
  }

  Widget trackCover(BoxConstraints constraints, PlayingAudio playingAudio) {
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
        child: AudioWaveWidget(
          audioWaver: waver,
          position: playingAudio.state.position,
        ),
      ),
    );
  }

  Widget trackTitle(PlayingAudio playingAudio) {
    String title = playingAudio.metadata?.title ?? widget.track.filePath;
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

  Widget trackAlbum(PlayingAudio playingAudio) {
    String album = playingAudio.metadata?.album ?? '-';
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

  Widget trackTimes(PlayingAudio playingAudio) {
    final position = playingAudio.state.position.minutesFormatted();
    final duration = playingAudio.state.duration.minutesFormatted();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          position,
          semanticsLabel: L10n.of(context).trackPosition(position),
          textScaleFactor: smallTextScaleFactor,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
          ),
        ),
        Text(
          duration,
          semanticsLabel: L10n.of(context).trackDuration(duration),
          textScaleFactor: smallTextScaleFactor,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: smallTextLetterSpacing,
          ),
        ),
      ],
    );
  }

  Widget trackProgress(PlayingAudio playingAudio) {
    return Slider.adaptive(
      value: playingAudio.state.position.inSeconds.toDouble(),
      max: playingAudio.state.duration.inSeconds.toDouble(),
      onChanged: playingAudio.state.canPlay ? onSeekTrack : null,
      semanticFormatterCallback: (value) => L10n.of(context)
          .trackPosition(Duration(seconds: value.toInt()).minutesFormatted()),
    );
  }

  void onSeekTrack(double value) {
    final playingAudio = context.read<PlayingAudio>();
    playingAudio.player?.seek(Duration(seconds: value.toInt()));
  }

  Widget trackControls(PlayingAudio playingAudio) {
    const buttonSize = paddingSize * 1.8;
    IconData icon;
    String playLabel;
    if (playingAudio.state.done) {
      icon = Icons.replay_sharp;
      playLabel = L10n.of(context).replay;
    } else if (playingAudio.state.playing) {
      icon = Icons.pause_sharp;
      playLabel = L10n.of(context).pause;
    } else {
      icon = Icons.play_arrow_sharp;
      playLabel = L10n.of(context).play;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        FloatingActionButton(
          onPressed: playingAudio.state.canPlay ? onPlay : null,
          heroTag: 'playButton',
          backgroundColor: primaryColor,
          elevation: paddingSize,
          tooltip: playLabel,
          child: Icon(
            icon,
            semanticLabel: playLabel,
            size: buttonSize,
          ),
        ),
      ],
    );
  }

  void onPlay() async {
    final playingAudio = context.read<PlayingAudio>();
    if (playingAudio.state.done) {
      await playingAudio.player?.seek(Duration.zero);
    }
    if (playingAudio.state.playing) {
      playingAudio.player?.pause();
    } else {
      playingAudio.player?.play();
    }
  }

  Widget volumeControls(PlayingAudio playingAudio) {
    final theme = Theme.of(context);
    final muteLabel = L10n.of(context).mute;
    final isMuted = audioIsMuted(playingAudio);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: paddingSize / 2),
          child: FloatingActionButton.small(
            onPressed: onToggleMute,
            heroTag: 'muteButton',
            tooltip: muteLabel,
            elevation: isMuted ? 0.1 : paddingSize / 4,
            foregroundColor: isMuted
                ? theme.colorScheme.onError
                : theme.colorScheme.onBackground,
            backgroundColor: isMuted
                ? theme.colorScheme.error
                : theme.colorScheme.background,
            child: Icon(
              Icons.volume_off_sharp,
              semanticLabel: muteLabel,
            ),
          ),
        ),
        const Icon(Icons.volume_down_sharp),
        Slider.adaptive(
          value: playingAudio.state.volume,
          onChanged: playingAudio.state.canPlay ? onVolumeChanged : null,
          activeColor: secondaryColor,
          semanticFormatterCallback: (value) =>
              L10n.of(context).volumeValue(value.toStringAsFixed(1)),
        ),
        const Icon(Icons.volume_up_sharp),
      ],
    );
  }

  void onVolumeChanged(double value) {
    final playingAudio = context.read<PlayingAudio>();
    playingAudio.player?.setVolume(value);
  }

  void onToggleMute() {
    final playingAudio = context.read<PlayingAudio>();
    if (audioIsMuted(playingAudio)) {
      playingAudio.player?.setVolume(lastVolume);
    } else {
      lastVolume = playingAudio.state.volume;
      playingAudio.player?.setVolume(0.0);
    }
  }

  Widget errorContent(String error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          error,
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
