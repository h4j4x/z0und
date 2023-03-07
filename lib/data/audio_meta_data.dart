import 'package:isar/isar.dart';

import '../model/audio_meta.dart';

part 'audio_meta_data.g.dart';

@Collection(accessor: 'audios_metas')
class AudioMetaData implements AudioMeta {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  String? fileNameValue;

  @override
  String get fileName => fileNameValue ?? '';

  @Index(caseSensitive: false)
  String? handlerIdValue;

  @override
  String get handlerId => handlerIdValue ?? '';

  @override
  String? audioName;

  @override
  int? durationInSeconds;

  bool? isEnabled;

  @override
  bool get enabled => isEnabled ?? true;
}
