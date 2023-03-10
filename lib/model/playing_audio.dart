import 'audio_meta.dart';

enum PlayingState {
  loading,
  playing,
  paused,
}

class PlayingAudio {
  final AudioMeta audioMeta;
  PlayingState state;

  PlayingAudio(
    this.audioMeta, {
    this.state = PlayingState.loading,
  });

  bool get isPlaying => state == PlayingState.playing;

  bool get isLoading => state == PlayingState.loading;

  get isPaused => state == PlayingState.paused;
}
