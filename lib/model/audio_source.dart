/// Information for audios sources.
abstract class AudioSource {
  AudioSourceType get sourceType;

  String get source;
}

enum AudioSourceType {
  url,
}
