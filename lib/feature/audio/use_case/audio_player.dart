import '../model/audio_player_state.dart';

abstract class AudioPlayer {
  Stream<AudioPlayerState> get stateStream;

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> dispose();

  Future<void> seek(Duration duration);

  Future<void> setVolume(double volume);
}
