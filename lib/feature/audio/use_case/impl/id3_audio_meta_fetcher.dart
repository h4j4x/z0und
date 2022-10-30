import 'package:id3/id3.dart';
import 'package:path/path.dart';

import '../../../../common/util/file_reader.dart';
import '../../model/audio_metadata.dart';
import '../../model/audio_track.dart';
import '../audio_meta_fetcher.dart';

class ID3AudioMetaFetcher extends AudioMetaFetcher {
  final AudioTrack track;

  ID3AudioMetaFetcher(this.track);

  @override
  Future<AudioMetadata> get metadata async {
    String? title;
    String? album;

    final buffer = await FileReader.readFull(track.filePath, track.fileSource);
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

    title ??= basenameWithoutExtension(track.filePath)
        .replaceAll('-', ' ')
        .replaceAll('_', ' ');
    album ??= '~~~';
    return AudioMetadata(
      title: title,
      album: album,
    );
  }
}