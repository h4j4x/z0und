import 'package:get_it/get_it.dart';

import '../model/music_source.dart';
import 'device_handler.dart';
import 'dropbox_handler.dart';

/// Handles music sources.
abstract class MusicSourceHandler {
  factory MusicSourceHandler(String id) {
    if (id == DropboxHandler.id) {
      return GetIt.I<DropboxHandler>();
    }
    return GetIt.I<DeviceMusicSourceHandler>();
  }

  /// This handler unique id.
  String get handlerId;

  /// If this handler is enabled.
  Future<bool> get handlerIsEnabled;

  /// Fetch available music sources.
  Future<List<MusicSource>> listSources();
}
