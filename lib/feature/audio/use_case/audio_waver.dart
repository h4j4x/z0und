import '../model/audio_track.dart';
import 'impl/just_audio_waver.dart';

abstract class AudioWaver {
  Stream<Object> get waveStream;

  static AudioWaver create(AudioTrack track) {
    return JustAudioWaver(track);
  }
}
