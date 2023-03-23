import 'package:isar/isar.dart';

import '../../handler/audio_meta_handler.dart';
import '../../helper/file.dart';
import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../data.dart';
import 'data/audio_meta_data.dart';
import 'data/audio_source_data.dart';

/// Isar integration.
///
/// * [Isar documentation](https://isar.dev/tutorials/quickstart.html)
class IsarDataService implements DataService {
  final Isar _isar;

  IsarDataService._(this._isar);

  static Future<DataService> create() async {
    final isar = await Isar.open([
      IsarAudioMetaSchema,
      IsarAudioSourceSchema,
    ]);
    return IsarDataService._(isar);
  }

  @override
  Future<List<AudioMeta>> scanAudiosMetas() async {
    final handlers = await AudioMetaHandler.enabledHandlers();
    final ids = <Id>[];
    for (final handler in handlers) {
      final list = await handler.listAudiosMetas();
      for (final audioMeta in list) {
        final id = await saveAudioMeta(audioMeta);
        ids.add(id);
      }
    }
    await FileHelper.clearDocumentsFolder();
    await _removeAudiosMetas(excludeIds: ids);
    return allAudiosMetas();
  }

  @override
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true}) async {
    final list =
        await _isar.audios_metas.filter().isEnabledEqualTo(enabled).findAll();
    return list.map((audioMeta) => AudioMetaData(audioMeta)).toList();
  }

  @override
  Future<AudioSource?> audioSourceOf(AudioMeta audioMeta) async {
    final audioSource = await _audioSourceOf(audioMeta);
    if (audioSource != null) {
      return audioSource;
    }
    final audioMetaId = await saveAudioMeta(audioMeta);
    return _fetchSource(audioMeta, audioMetaId);
  }

  Future<AudioSource?> _audioSourceOf(AudioMeta audioMeta) async {
    final audioMetaId = await saveAudioMeta(audioMeta);
    final audioSource = await _isar.audios_sources
        .filter()
        .audioMetaIdEqualTo(audioMetaId)
        .and()
        .expiresAtMillisGreaterThan(DateTime.now().millisecondsSinceEpoch)
        .findFirst();
    if (audioSource != null) {
      return AudioSourceData(audioSource);
    }
    return null;
  }

  Future<AudioSource?> _fetchSource(AudioMeta audioMeta, int metaId) async {
    final handler = await AudioMetaHandler.getHandler(audioMeta.handlerId);
    if (handler != null) {
      final audioSource = await handler.fetchAudioSource(audioMeta);
      if (audioSource != null) {
        await _saveAudioSource(audioSource, metaId);
        return audioSource;
      }
    }
    return null;
  }

  @override
  Future<int> saveAudioMeta(AudioMeta audioMeta) async {
    var audioMetaIsar = await _isar.audios_metas
        .filter()
        .codeEqualTo(audioMeta.code)
        .and()
        .handlerIdEqualTo(audioMeta.handlerId)
        .findFirst();
    audioMetaIsar ??= IsarAudioMeta();
    audioMetaIsar
      ..name = audioMeta.name
      ..handlerId = audioMeta.handlerId
      ..code = audioMeta.code
      ..audioName = audioMeta.audioName
      ..durationInSeconds = audioMeta.duration?.inSeconds;
    audioMetaIsar.isEnabled ??= true;
    await _isar.writeTxn(() async {
      await _isar.audios_metas.put(audioMetaIsar!);
    });
    return audioMetaIsar.id;
  }

  Future _removeAudiosMetas({required List<int> excludeIds}) async {
    await _isar.writeTxn(() async {
      return _isar.audios_metas
          .filter()
          .not()
          .anyOf(excludeIds, (query, id) => query.idEqualTo(id))
          .deleteAll();
    });
    return Future.value(null);
  }

  Future<Id> _saveAudioSource(AudioSource audioSource, int audioMetaId) async {
    var sourceIsar = await _isar.audios_sources
        .filter()
        .audioMetaIdEqualTo(audioMetaId)
        .findFirst();
    sourceIsar ??= IsarAudioSource();
    sourceIsar
      ..audioMetaId = audioMetaId
      ..sourceType = audioSource.sourceType
      ..source = audioSource.source
      ..expiresAtMillis = audioSource.expiresAt.millisecondsSinceEpoch;
    await _isar.writeTxn(() async {
      await _isar.audios_sources.put(sourceIsar!);
    });
    return sourceIsar.id;
  }

  @override
  Future removeAudioSourceOf(AudioMeta audioMeta) async {
    final audioMetaId = await saveAudioMeta(audioMeta);
    await _isar.writeTxn(() async {
      await _isar.audios_sources
          .filter()
          .audioMetaIdEqualTo(audioMetaId)
          .deleteAll();
    });
    return Future.value(null);
  }

  Future clear() async {
    await _isar.writeTxn(() async {
      await _isar.audios_metas.filter().idGreaterThan(0).deleteAll();
      await _isar.audios_sources.filter().idGreaterThan(0).deleteAll();
    });
    return Future.value(null);
  }
}

class AudioMetaData implements AudioMeta {
  final IsarAudioMeta data;

  AudioMetaData(this.data);

  @override
  String get name => data.name ?? '';

  @override
  String get handlerId => data.handlerId ?? '';

  @override
  String get code => data.code ?? '';

  @override
  String? get audioName => data.audioName;

  @override
  set audioName(String? value) => data.audioName = value;

  @override
  bool get enabled => data.isEnabled ?? true;

  @override
  @ignore
  Duration? get duration => data.durationInSeconds != null
      ? Duration(seconds: data.durationInSeconds!)
      : null;

  @override
  set duration(Duration? duration) =>
      data.durationInSeconds = duration?.inSeconds;

  @override
  bool operator ==(Object other) {
    if (other is AudioMeta) {
      return other.code == data.code && other.handlerId == data.handlerId;
    }
    return false;
  }

  @override
  int get hashCode {
    if (data.code != null && data.handlerId != null) {
      return data.code!.hashCode ^ data.handlerId!.hashCode;
    }
    return 0;
  }
}

class AudioSourceData implements AudioSource {
  final IsarAudioSource data;

  AudioSourceData(this.data);

  @override
  String get source => data.source ?? '';

  @override
  AudioSourceType get sourceType => data.sourceType ?? AudioSourceType.url;

  @override
  DateTime get expiresAt {
    if (data.expiresAtMillis != null) {
      return DateTime.fromMillisecondsSinceEpoch(data.expiresAtMillis!);
    }
    return DateTime.now();
  }
}
