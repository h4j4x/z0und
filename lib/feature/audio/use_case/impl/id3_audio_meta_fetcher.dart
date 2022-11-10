import 'package:id3/id3.dart';
import 'package:path/path.dart';

import '../../../../common/util/file_utils.dart';
import '../../model/audio_metadata.dart';
import '../../model/audio_track.dart';
import '../audio_meta_fetcher.dart';

class ID3AudioMetaFetcher extends AudioMetaFetcher {
  final AudioTrack track;

  ID3AudioMetaFetcher(this.track);

  get _rawTitle => basenameWithoutExtension(track.filePath)
      .replaceAll('-', ' ')
      .replaceAll('_', ' ');

  get _rawAlbum => '~~~';

  @override
  AudioMetadata get initial => AudioMetadata(
        track: track,
        title: _rawTitle,
        album: _rawAlbum,
      );

  @override
  Future<AudioMetadata> get metadata async {
    String? title;
    String? album;

    final buffer = await FileUtils.readFull(track.filePath, track.fileSource);
    if (buffer != null) {
      var mp3 = MP3Instance(buffer.asUint8List().toList());
      if (mp3.parseTagsSync()) {
        final map = mp3.metaTags;
        if (map['Title'] is String) {
          title = map['Title'];
        }
        if (map['Album'] is String) {
          album = map['Album'];
        }
      }
    }
    return AudioMetadata(
      track: track,
      title: title ?? _rawTitle,
      album: album ?? _rawAlbum,
    );
  }
}
