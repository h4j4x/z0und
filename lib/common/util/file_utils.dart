import 'dart:async';
import 'dart:io';

import '../model/audio_track.dart';

abstract class FileUtils {
  static Future<void> copyToFile(AudioTrack track, File target) async {
    await target.writeAsBytes(track.buffer.asUint8List().toList());
  }
}
