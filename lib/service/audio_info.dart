import '../ioc.dart';
import '../model/audio_info.dart';
import '../model/audio_source.dart';

/// Audio info fetcher.
abstract class AudioInfoService {
  factory AudioInfoService() => Ioc.get<AudioInfoService>();

  Future<AudioInfo?> fetchAudioInfo(AudioSource audioSource);
}
