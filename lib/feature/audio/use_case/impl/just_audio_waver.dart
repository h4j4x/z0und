import 'dart:async';
import 'dart:io';

import 'package:just_waveform/just_waveform.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../common/util/file_utils.dart';
import '../../model/audio_track.dart';
import '../audio_waver.dart';

class JustAudioWaver implements AudioWaver {
  final AudioTrack track;
  final int pixelsPerSecond;
  final StreamController<Object> _controller;

  JustAudioWaver(
    this.track, {
    this.pixelsPerSecond = 100,
  }) : _controller = StreamController<Object>() {
    _setupStream();
  }

  void _setupStream() async {
    final tmpDir = await getTemporaryDirectory();
    final trackPath = path.join(tmpDir.path, path.basename(track.filePath));
    final trackFile = File(trackPath);
    await FileUtils.copyToFile(track.filePath, track.fileSource, trackFile);
    final wavePath = path.join(
        tmpDir.path, '${path.basenameWithoutExtension(track.filePath)}.wave');
    JustWaveform.extract(
      audioInFile: trackFile,
      waveOutFile: File(wavePath),
      zoom: WaveformZoom.pixelsPerSecond(pixelsPerSecond),
    ).listen((data) {
      _controller.sink.add(data);
    }, onError: _controller.addError);
  }

  @override
  Stream<Object> get waveStream => _controller.stream;
}
