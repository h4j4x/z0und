/// Information for audios.
abstract class AudioMeta {
  String get name;

  /// Id of associated `AudioMetaHandler`.
  String get handlerId;

  /// Code of audio meta for it's handler.
  String get code;

  String? get audioName;

  /// Duration of audio meta.
  Duration? get duration;

  set duration(Duration? value);

  bool get enabled;
}
