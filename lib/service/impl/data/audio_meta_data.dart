import 'package:isar/isar.dart';

part 'audio_meta_data.g.dart';

@Collection(accessor: 'audios_metas')
class IsarAudioMeta {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  String? name;

  @Index(caseSensitive: false)
  String? handlerId;

  String? code;

  String? title;

  String? artist;

  int? durationInSeconds;

  bool? isEnabled;
}
