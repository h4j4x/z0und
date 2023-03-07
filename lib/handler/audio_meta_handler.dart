import 'package:get_it/get_it.dart';

import '../model/audio_meta.dart';
import 'impl/device_handler.dart';
import 'impl/dropbox_handler.dart';

/// Handles audios metas.
abstract class AudioMetaHandler {
  /// Gets all enabled handlers.
  static Future<List<AudioMetaHandler>> enabledHandlers() async {
    // todo: obtains by interface
    final allHandlers = <AudioMetaHandler>[
      GetIt.I<DropboxHandler>(),
      GetIt.I<DeviceAudioMetaHandler>(),
    ];
    final enabledHandlers = <AudioMetaHandler>[];
    await Future.forEach(allHandlers, (handler) async {
      if (await handler.handlerIsEnabled) {
        enabledHandlers.add(handler);
      }
    });
    return enabledHandlers;
  }

  /// Counts all enabled handlers.
  static Future<int> countEnabledHandlers() async {
    // todo: obtains by interface
    final allHandlers = <AudioMetaHandler>[
      GetIt.I<DropboxHandler>(),
      GetIt.I<DeviceAudioMetaHandler>(),
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
  /// Defaults to [DeviceAudioMetaHandler] if not found any matching handler.
  factory AudioMetaHandler.get(String id) {
    if (id == DropboxHandler.id) {
      return GetIt.I<DropboxHandler>();
    }
    return GetIt.I<DeviceAudioMetaHandler>();
  }

  /// This handler unique id.
  String get handlerId;

  /// If this handler is enabled.
  Future<bool> get handlerIsEnabled;

  /// Fetch available audios metas.
  Future<List<AudioMeta>> listAudiosMetas();
}
