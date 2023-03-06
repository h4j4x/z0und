import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../data/music_source.dart';
import '../handler/music_source_handler.dart';
import '../model/music_source.dart';

abstract class DataService {
  static Future<DataService> create() => IsarDataService._create();

  factory DataService() => GetIt.I<DataService>();

  /// Scans for music sources and saves it.
  Future<List<MusicSource>> scanMusicSources();

  /// Fetch music sources.
  Future<List<MusicSource>> allMusicSources({bool enabled = true});
}

/// Isar integration.
///
/// * [Isar documentation](https://isar.dev/tutorials/quickstart.html)
class IsarDataService implements DataService {
  final Isar isar;

  IsarDataService._(this.isar);

  static Future<DataService> _create() async {
    final isar = await Isar.open([MusicSourceDataSchema]);
    return IsarDataService._(isar);
  }

  @override
  Future<List<MusicSource>> scanMusicSources() async {
    final handlers = await MusicSourceHandler.enabledHandlers();
    final ids = <Id>[];
    for (final handler in handlers) {
      final sources = await handler.listSources();
      for (final source in sources) {
        final id = await _saveMusicSource(source);
        ids.add(id);
      }
    }
    await _removeMusicSources(excludeIds: ids);
    return allMusicSources();
  }

  @override
  Future<List<MusicSource>> allMusicSources({bool enabled = true}) {
    return isar.musics.filter().isEnabledEqualTo(enabled).findAll();
  }

  Future<Id> _saveMusicSource(MusicSource source) async {
    var sourceIsar = await isar.musics
        .filter()
        .sourceNameEqualTo(source.sourceName)
        .and()
        .handlerIdEqualTo(source.handlerId)
        .findFirst();
    sourceIsar ??= MusicSourceData();
    sourceIsar
      ..sourceNameValue = source.sourceName
      ..handlerIdValue = source.handlerId
      ..updatedAtMillis = source.updatedAt.millisecondsSinceEpoch
      ..songName = source.songName
      ..durationInSeconds = source.durationInSeconds;
    await isar.writeTxn(() async {
      await isar.musics.put(sourceIsar!);
    });
    return sourceIsar.id;
  }

  Future _removeMusicSources({required List<int> excludeIds}) {
    return isar.musics
        .filter()
        .not()
        .anyOf(excludeIds, (q, id) => q.idEqualTo(id))
        .deleteAll();
  }
}
