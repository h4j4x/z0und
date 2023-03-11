import '../model/audio_meta.dart';
import '../model/audio_source.dart';

/// Handles audios metas.
abstract class AudioMetaHandler {
  static final _handlers = <AudioMetaHandler>{};

  /// Registers given [handler].
  static void registerHandler(AudioMetaHandler handler) async {
    _handlers.add(handler);
  }

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

  /// Gets a handler by [id] or `null` if not found any matching handler.
  static Future<AudioMetaHandler?> getHandler(String id) async {
    final handlers = await enabledHandlers();
    for (final handler in handlers) {
      if (id == handler.handlerId) {
        return handler;
      }
    }
    return null;
  }

  /// Handler unique id.
  String get handlerId;

  /// If this handler is enabled.
  Future<bool> get handlerIsEnabled;

  /// Fetch available audios.
  Future<List<AudioMeta>> listAudiosMetas();

  /// Fetch `AudioSource` for given [audioMeta].
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta);
}
