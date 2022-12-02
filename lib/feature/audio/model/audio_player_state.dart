class AudioPlayerState {
  final bool loading;
  final bool canPlay;
  final bool playing;
  final bool done;
  final Duration duration;
  final Duration position;
  final double volume;
  final String? error;

  AudioPlayerState({
    this.loading = false,
    this.canPlay = false,
    this.playing = false,
    this.done = false,
    this.duration = Duration.zero,
    this.position = Duration.zero,
    this.volume = 0.5,
    this.error,
  });
}
