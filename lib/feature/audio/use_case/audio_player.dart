import '../model/audio_player_state.dart';

abstract class AudioPlayer {
  Stream<AudioPlayerState> stateStream();

  Stream<Duration> positionStream();

  Future<Duration?> fetchDuration();

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> dispose();

  Future<void> seek(Duration duration);
}
