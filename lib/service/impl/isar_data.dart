import 'package:isar/isar.dart';

import '../../data/audio_meta_data.dart';
import '../../data/audio_source_data.dart';
import '../../handler/audio_meta_handler.dart';
import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../data.dart';

/// Isar integration.
///
/// * [Isar documentation](https://isar.dev/tutorials/quickstart.html)
class IsarDataService implements DataService {
  final Isar _isar;

  IsarDataService._(this._isar);

  static Future<DataService> create() async {
    final isar = await Isar.open([
      AudioMetaDataSchema,
      AudioSourceDataSchema,
    ]);
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
    return _fetchSource(audioMeta, audioMetaId);
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
        .anyOf(excludeIds, (query, id) => query.idEqualTo(id))
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
