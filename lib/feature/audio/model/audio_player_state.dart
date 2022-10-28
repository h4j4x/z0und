class AudioPlayerState {
  final bool loading;
  final bool canPlay;
  final bool playing;
  final bool done;
  final Duration duration;
  final Duration position;
  final String? error;

  AudioPlayerState({
    this.loading = true,
    this.canPlay = false,
    this.playing = false,
    this.done = false,
    this.duration = Duration.zero,
    this.position = Duration.zero,
    this.error,
  });
}
