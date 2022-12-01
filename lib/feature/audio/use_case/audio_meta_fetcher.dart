import '../model/audio_metadata.dart';
import '../../../common/model/audio_track.dart';
import 'impl/id3_audio_meta_fetcher.dart';

abstract class AudioMetaFetcher {
  AudioMetadata get initial;

  Future<AudioMetadata> get metadata;

  static AudioMetaFetcher create(AudioTrack track) =>
      ID3AudioMetaFetcher(track);
}
