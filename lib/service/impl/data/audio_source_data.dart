import 'package:isar/isar.dart';

import '../../../model/audio_source.dart';

part 'audio_source_data.g.dart';

@Collection(accessor: 'audios_sources')
class IsarAudioSource {
  Id id = Isar.autoIncrement;

  @Index()
  int? audioMetaId;

  @Enumerated(EnumType.name)
  AudioSourceType? sourceType;

  String? source;

  @Index()
  int? expiresAtMillis;
}
