import '../../../common/data/listener_handler.dart';
import '../model/audio_player_state.dart';

abstract class AudioPlayer with ListenerHandler<AudioPlayerState> {
  Future<Duration?> fetchDuration();

  Future<void> play();

  Future<void> pause();
}
