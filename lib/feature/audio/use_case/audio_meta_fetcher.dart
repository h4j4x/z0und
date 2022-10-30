import '../model/audio_metadata.dart';
import '../model/audio_track.dart';
import 'impl/dummy_audio_meta_fetcher.dart';

abstract class AudioMetaFetcher {
  Future<AudioMetadata> get metadata;

  static AudioMetaFetcher create(AudioTrack track) =>
      DummyAudioMetaFetcher(track);
}
