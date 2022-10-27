class AudioPlayerState {
  bool? _canPlay;
  bool playing = false;
  Duration? duration;
  Duration position = Duration.zero;
  String? error;

  bool get canPlay => _canPlay ?? false;

  set canPlay(bool value) => _canPlay = value;

  void merge(AudioPlayerState state) {
    if (state._canPlay != null) {
      _canPlay = state._canPlay;
    }
    playing = state.playing;
  }
}
