/// Information for audios sources.
abstract class AudioSource {
  AudioSourceType get sourceType;

  String get source;

  DateTime get expiresAt;
}

enum AudioSourceType {
  url,
  file,
}
