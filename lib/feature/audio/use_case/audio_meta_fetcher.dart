import '../model/audio_metadata.dart';
import '../model/audio_track.dart';
import 'impl/id3_audio_meta_fetcher.dart';

abstract class AudioMetaFetcher {
  Future<AudioMetadata> get metadata;

  static AudioMetaFetcher create(AudioTrack track) =>
      ID3AudioMetaFetcher(track);
}
