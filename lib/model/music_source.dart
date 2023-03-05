abstract class MusicSource {
  String get sourceName;

  String get handlerId;

  DateTime get updatedAt;

  String? get songName;

  int? get durationInSeconds;

  bool get enabled;
}
