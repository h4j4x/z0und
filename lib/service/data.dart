import 'package:isar/isar.dart';

import '../data/audio_meta_data.dart';
import '../data/audio_source_data.dart';
import '../handler/audio_meta_handler.dart';
import '../ioc.dart';
import '../model/audio_meta.dart';
import '../model/audio_source.dart';

abstract class DataService {
  static Future<DataService> create() => IsarDataService._create();

  factory DataService() => Ioc.get<DataService>();

  /// Scans for audios metas and saves it.
  Future<List<AudioMeta>> scanAudiosMetas();

  /// Fetch audios metas.
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true});

  /// Fetch audio source of audio meta.
  Future<AudioSource?> audioSourceOf(AudioMeta audioMeta);

  /// Saves audio meta.
  Future<Id> saveAudioMeta(AudioMeta audioMeta);
}

/// Isar integration.
///
/// * [Isar documentation](https://isar.dev/tutorials/quickstart.html)
class IsarDataService implements DataService {
  final Isar _isar;

  IsarDataService._(this._isar);

  static Future<DataService> _create() async {
    final isar = await Isar.open([AudioMetaDataSchema]);
    return IsarDataService._(isar);
  }

  @override
  Future<List<AudioMeta>> scanAudiosMetas() async {
    final handlers = await AudioMetaHandler.enabledHandlers();
    final ids = <Id>[];
    for (final handler in handlers) {
      final sources = await handler.listAudiosMetas();
      for (final source in sources) {
        final id = await saveAudioMeta(source);
        ids.add(id);
      }
    }
    await _removeAudiosMetas(excludeIds: ids);
    return allAudiosMetas();
  }

  @override
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true}) {
    return _isar.audios_metas.filter().isEnabledEqualTo(enabled).findAll();
  }

  @override
  Future<AudioSource?> audioSourceOf(AudioMeta audioMeta) async {
    final audioMetaId = (audioMeta is AudioMetaData)
        ? audioMeta.id
        : await saveAudioMeta(audioMeta);
    final audioSource = await _isar.audios_sources
        .filter()
        .audioMetaIdEqualTo(audioMetaId)
        .and()
        .expiresAtGreaterThan(DateTime.now())
        .findFirst();
    if (audioSource != null) {
      return audioSource;
    }

    final handler = AudioMetaHandler.get(audioMeta.handlerId);
    final source = await handler.fetchAudioSource(audioMeta);
    if (source != null) {
      _saveAudioSource(source, audioMetaId);
      return audioSource;
    }
    return null;
  }

  @override
  Future<Id> saveAudioMeta(AudioMeta audioMeta) async {
    var audioMetaIsar = await _isar.audios_metas
        .filter()
        .codeEqualTo(audioMeta.code)
        .and()
        .handlerIdEqualTo(audioMeta.handlerId)
        .findFirst();
    audioMetaIsar ??= AudioMetaData();
    audioMetaIsar
      ..nameValue = audioMeta.name
      ..handlerIdValue = audioMeta.handlerId
      ..codeValue = audioMeta.code
      ..audioName = audioMeta.audioName
      ..durationInSeconds = audioMeta.durationInSeconds;
    audioMetaIsar.isEnabled ??= true;
    await _isar.writeTxn(() async {
      await _isar.audios_metas.put(audioMetaIsar!);
    });
    return audioMetaIsar.id;
  }

  Future _removeAudiosMetas({required List<int> excludeIds}) {
    return _isar.audios_metas
        .filter()
        .not()
        .anyOf(excludeIds, (q, id) => q.idEqualTo(id))
        .deleteAll();
  }

  Future<Id> _saveAudioSource(AudioSource audioSource, int audioMetaId) async {
    var sourceIsar = await _isar.audios_sources
        .filter()
        .audioMetaIdEqualTo(audioMetaId)
        .findFirst();
    sourceIsar ??= AudioSourceData();
    sourceIsar
      ..audioMetaId = audioMetaId
      ..sourceTypeValue = audioSource.sourceType
      ..sourceValue = audioSource.source
      ..expiresAtMillis = audioSource.expiresAt.millisecondsSinceEpoch;
    await _isar.writeTxn(() async {
      await _isar.audios_sources.put(sourceIsar!);
    });
    return sourceIsar.id;
  }
}
