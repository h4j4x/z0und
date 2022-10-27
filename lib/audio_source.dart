import 'package:just_audio/just_audio.dart';

import 'audio_track.dart';
import 'file_reader.dart';

class AudioTrackSource extends StreamAudioSource {
  final AudioTrack track;
  int _trackLengthInBytes = -1;

  AudioTrackSource(this.track);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    final length = await _trackLength();
    final stream = FileReader.read(track.filePath, track.fileSource);
    start ??= 0;
    end ??= length;
    return StreamAudioResponse(
      sourceLength: length,
      contentLength: end - start,
      offset: start,
      stream: stream
          .map((buffer) => buffer.asInt8List(start!, end! - start).toList()),
      contentType: 'audio/mpeg', // todo
    );
  }

  Future<int> _trackLength() async {
    if (_trackLengthInBytes < 0) {
      _trackLengthInBytes =
          await FileReader.readBytesLength(track.filePath, track.fileSource);
    }
    return _trackLengthInBytes;
  }
}
