import 'package:get_it/get_it.dart';

import '../model/audio_meta.dart';
import '../model/audio_source.dart';
import 'impl/device_handler.dart';
import 'impl/dropbox_handler.dart';

/// Handles audios metas.
abstract class AudioMetaHandler {
  /// Gets all enabled handlers.
  static Future<List<AudioMetaHandler>> enabledHandlers() async {
    final enabledHandlers = <AudioMetaHandler>[];
    await Future.forEach(_handlers, (handler) async {
      if (await handler.handlerIsEnabled) {
        enabledHandlers.add(handler);
      }
    });
    return enabledHandlers;
  }

  /// Counts all enabled handlers.
  static Future<int> countEnabledHandlers() async {
    int count = 0;
    await Future.forEach(_handlers, (handler) async {
      if (await handler.handlerIsEnabled) {
        count++;
      }
    });
    return count;
  }

  /// Fetch `AudioSource` for given [audioMeta].
  static Future<AudioSource?> fetchSource(AudioMeta audioMeta) {
    for (final handler in _handlers) {
      if (handler.handlerId == audioMeta.handlerId) {
        return handler.fetchAudioSource(audioMeta);
      }
    }
    return Future.value(null);
  }

  static List<AudioMetaHandler> get _handlers => <AudioMetaHandler>[
        GetIt.I<DeviceAudioMetaHandler>(),
        GetIt.I<DropboxHandler>(),
      ];

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

  /// Fetch `AudioSource` for given [audioMeta].
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta);
}
