import 'package:file_picker/file_picker.dart';
import 'package:z0und/common/model/file_source.dart';
import 'package:z0und/feature/audio/model/audio_track.dart';

import '../track_picker.dart';

class FileTrackPicker implements TrackPicker {
  @override
  Future<List<AudioTrack>> pickTracks({String? title}) async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: title,
      type: FileType.custom,
      allowedExtensions: ['mp3'],
      allowMultiple: true,
      lockParentWindow: true,
    );
    if (result != null) {
      return result.files
          .where((file) => file.path != null)
          .map((file) =>
              AudioTrack(filePath: file.path!, fileSource: FileSource.device))
          .toList();
    }
    return [];
  }
}
