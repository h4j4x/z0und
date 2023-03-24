/// Information for audios.
abstract class AudioMeta {
  String get name;

  /// Id of associated `AudioMetaHandler`.
  String get handlerId;

  /// Code of audio meta for it's handler.
  String get code;

  /// Title of audio.
  String? get title;

  set title(String? value);

  /// Artist of audio.
  String? get artist;

  set artist(String? value);

  /// Duration of audio.
  Duration? get duration;

  set duration(Duration? value);

  bool get enabled;
}
