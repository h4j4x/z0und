import '../../ioc.dart';
import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../audio_meta_handler.dart';

class DeviceAudioMetaHandler implements AudioMetaHandler {
  factory DeviceAudioMetaHandler.create() {
    final handler = DeviceAudioMetaHandler._();
    AudioMetaHandler.registerHandler(handler);
    return handler;
  }

  factory DeviceAudioMetaHandler() => Ioc.get<DeviceAudioMetaHandler>();

  DeviceAudioMetaHandler._();

  @override
  String get handlerId => 'device';

  @override
  Future<bool> get handlerIsEnabled => Future.value(false); // todo

  @override
  Future<List<AudioMeta>> listAudiosMetas() {
    // todo
    return Future.value([]);
  }

  @override
  Future<AudioSource?> fetchAudioSource(AudioMeta audioMeta) {
    // TODO: implement fetchAudioSource
    throw UnimplementedError();
  }
}
