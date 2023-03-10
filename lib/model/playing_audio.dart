import 'audio_meta.dart';

enum PlayingState {
  none,
  playing,
  paused,
}

class PlayingAudio {
  final AudioMeta audioMeta;
  PlayingState state;

  PlayingAudio(
    this.audioMeta, {
    this.state = PlayingState.none,
  });

  bool get isPlaying => state == PlayingState.playing;

  bool get isPaused => state == PlayingState.paused;
}
