import 'package:isar/isar.dart';

import '../../../model/audio_meta.dart';

part 'audio_meta_data.g.dart';

@Collection(accessor: 'audios_metas')
class AudioMetaData implements AudioMeta {
  Id id = Isar.autoIncrement;

  @Index(caseSensitive: false)
  String? nameValue;

  @override
  String get name => nameValue ?? '';

  @Index(caseSensitive: false)
  String? handlerIdValue;

  @override
  String get handlerId => handlerIdValue ?? '';

  String? codeValue;

  @override
  String get code => codeValue ?? '';

  @override
  String? audioName;

  int? durationInSeconds;

  bool? isEnabled;

  @override
  bool get enabled => isEnabled ?? true;

  @override
  Duration? get duration =>
      durationInSeconds != null ? Duration(seconds: durationInSeconds!) : null;

  @override
  set duration(Duration? duration) => durationInSeconds = duration?.inSeconds;

  @override
  bool operator ==(Object other) {
    if (other is AudioMeta) {
      return other.code == codeValue && other.handlerId == handlerIdValue;
    }
    return false;
  }

  @override
  int get hashCode {
    if (codeValue != null && handlerIdValue != null) {
      return codeValue!.hashCode ^ handlerIdValue!.hashCode;
    }
    return 0;
  }
}
