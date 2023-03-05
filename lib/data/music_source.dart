import 'package:isar/isar.dart';

import '../model/music_source.dart';

part 'music_source.g.dart';

@collection
class MusicSourceIsar implements MusicSource {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  String? sourceNameValue;

  @override
  String get sourceName => sourceNameValue ?? '';

  @Index(caseSensitive: false)
  String? handlerIdValue;

  @override
  String get handlerId => handlerIdValue ?? '';

  int? updatedAtMillis;

  @override
  DateTime get updatedAt {
    if (updatedAtMillis != null) {
      return DateTime.fromMillisecondsSinceEpoch(updatedAtMillis!);
    }
    return DateTime.now();
  }

  @override
  String? songName;

  @override
  int? durationInSeconds;

  bool? isEnabled;

  @override
  bool get enabled => isEnabled ?? true;
}
