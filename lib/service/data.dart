import 'package:isar/isar.dart';

import '../data/audio_meta_data.dart';
import '../handler/audio_meta_handler.dart';
import '../ioc.dart';
import '../model/audio_meta.dart';

abstract class DataService {
  static Future<DataService> create() => IsarDataService._create();

  factory DataService() => Ioc.get<DataService>();

  /// Scans for audios metas and saves it.
  Future<List<AudioMeta>> scanAudiosMetas();

  /// Fetch audios metas.
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true});
}

/// Isar integration.
///
/// * [Isar documentation](https://isar.dev/tutorials/quickstart.html)
class IsarDataService implements DataService {
  final Isar isar;

  IsarDataService._(this.isar);

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
        final id = await _saveAudioMeta(source);
        ids.add(id);
      }
    }
    await _removeAudiosMetas(excludeIds: ids);
    return allAudiosMetas();
  }

  @override
  Future<List<AudioMeta>> allAudiosMetas({bool enabled = true}) {
    return isar.audios_metas.filter().isEnabledEqualTo(enabled).findAll();
  }

  Future<Id> _saveAudioMeta(AudioMeta source) async {
    var sourceIsar = await isar.audios_metas
        .filter()
        .codeEqualTo(source.code)
        .and()
        .handlerIdEqualTo(source.handlerId)
        .findFirst();
    sourceIsar ??= AudioMetaData();
    sourceIsar
      ..nameValue = source.name
      ..handlerIdValue = source.handlerId
      ..codeValue = source.code
      ..audioName = source.audioName
      ..durationInSeconds = source.durationInSeconds;
    sourceIsar.isEnabled ??= true;
    await isar.writeTxn(() async {
      await isar.audios_metas.put(sourceIsar!);
    });
    return sourceIsar.id;
  }

  Future _removeAudiosMetas({required List<int> excludeIds}) {
    return isar.audios_metas
        .filter()
        .not()
        .anyOf(excludeIds, (q, id) => q.idEqualTo(id))
        .deleteAll();
  }
}
