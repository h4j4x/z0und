import 'audio_meta.dart';

/// Extra information for audios.
class AudioInfo {
  final String? title;
  final String? artist;

  AudioInfo({required this.title, required this.artist});

  void update(AudioMeta audioMeta) {
    audioMeta.title = title;
    audioMeta.artist = artist;
  }
}
