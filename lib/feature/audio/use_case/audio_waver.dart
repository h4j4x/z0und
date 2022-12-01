import '../../../common/model/audio_track.dart';
import 'impl/just_audio_waver.dart';

abstract class AudioWaver {
  Stream<Object> get waveStream;

  void dispose();

  static AudioWaver create(AudioTrack track) {
    return JustAudioWaver(track);
  }
}
