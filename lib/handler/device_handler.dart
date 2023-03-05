import 'package:get_it/get_it.dart';
import 'package:z0und/model/music_source.dart';

import 'music_source_handler.dart';

class DeviceMusicSourceHandler implements MusicSourceHandler {
  factory DeviceMusicSourceHandler.create() => DeviceMusicSourceHandler._();

  factory DeviceMusicSourceHandler() => GetIt.I<DeviceMusicSourceHandler>();

  DeviceMusicSourceHandler._();

  @override
  String get handlerId => 'device';

  @override
  Future<bool> get handlerIsEnabled => Future.value(true);

  @override
  Future<List<MusicSource>> listSources() {
    // todo
    return Future.value([]);
  }
}
