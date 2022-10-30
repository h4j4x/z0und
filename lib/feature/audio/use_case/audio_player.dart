import '../model/audio_player_state.dart';
import '../model/audio_track.dart';
import 'impl/just_audio_player.dart';

abstract class AudioPlayer {
  Stream<AudioPlayerState> get stateStream;

  Future<void> play();

  Future<void> pause();

  Future<void> stop();

  Future<void> dispose();

  Future<void> seek(Duration duration);

  Future<void> setVolume(double volume);

  static AudioPlayer create(AudioTrack track) => JustAudioPlayer(track);
}
