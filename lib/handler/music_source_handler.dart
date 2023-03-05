import 'package:get_it/get_it.dart';

import '../model/music_source.dart';
import 'device_handler.dart';
import 'dropbox_handler.dart';

/// Handles music sources.
abstract class MusicSourceHandler {
  /// Gets all enabled handlers.
  static Future<List<MusicSourceHandler>> enabledHandlers() async {
    final allHandlers = <MusicSourceHandler>[
      GetIt.I<DropboxHandler>(),
      GetIt.I<DeviceMusicSourceHandler>(),
    ];
    final enabledHandlers = <MusicSourceHandler>[];
    await Future.forEach(allHandlers, (handler) async {
      if (await handler.handlerIsEnabled) {
        enabledHandlers.add(handler);
      }
    });
    return enabledHandlers;
  }

  /// Counts all enabled handlers.
  static Future<int> countEnabledHandlers() async {
    final allHandlers = <MusicSourceHandler>[
      GetIt.I<DropboxHandler>(),
      GetIt.I<DeviceMusicSourceHandler>(),
    ];
    int count = 0;
    await Future.forEach(allHandlers, (handler) async {
      if (await handler.handlerIsEnabled) {
        count++;
      }
    });
    return count;
  }

  /// Gets a handler by [id].
  ///
  /// Defaults to [DeviceMusicSourceHandler] if not found any matching handler.
  factory MusicSourceHandler.get(String id) {
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
