import 'package:path/path.dart';

import '../../model/audio_metadata.dart';
import '../../model/audio_track.dart';
import '../audio_meta_fetcher.dart';

class DummyAudioMetaFetcher extends AudioMetaFetcher {
  final AudioTrack track;

  DummyAudioMetaFetcher(this.track);

  @override
  Future<AudioMetadata> get metadata {
    final title = basenameWithoutExtension(track.filePath)
        .replaceAll('-', ' ')
        .replaceAll('_', ' ');
    return Future.value(AudioMetadata(
      title: title,
      album: '~~~',
    ));
  }
}
