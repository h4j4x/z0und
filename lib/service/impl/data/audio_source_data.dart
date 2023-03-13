import 'package:isar/isar.dart';

import '../../../model/audio_source.dart';

part 'audio_source_data.g.dart';

@Collection(accessor: 'audios_sources')
class AudioSourceData implements AudioSource {
  Id id = Isar.autoIncrement;

  @Index()
  int? audioMetaId;

  @Enumerated(EnumType.name)
  AudioSourceType? sourceTypeValue;

  String? sourceValue;

  @Index()
  int? expiresAtMillis;

  @override
  String get source => sourceValue ?? '';

  @override
  @Enumerated(EnumType.name)
  AudioSourceType get sourceType => sourceTypeValue ?? AudioSourceType.url;

  @override
  DateTime get expiresAt {
    if (expiresAtMillis != null) {
      return DateTime.fromMillisecondsSinceEpoch(expiresAtMillis!);
    }
    return DateTime.now();
  }
}
