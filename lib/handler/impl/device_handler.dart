import 'package:get_it/get_it.dart';

import '../../model/audio_meta.dart';
import '../audio_meta_handler.dart';

class DeviceAudioMetaHandler implements AudioMetaHandler {
  factory DeviceAudioMetaHandler.create() => DeviceAudioMetaHandler._();

  factory DeviceAudioMetaHandler() => GetIt.I<DeviceAudioMetaHandler>();

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
}
