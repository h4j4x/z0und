import '../../audio/model/audio_track.dart';
import 'impl/file_track_picker.dart';

abstract class TrackPicker {
  Future<List<AudioTrack>> pickTracks();

  static TrackPicker create() => FileTrackPicker();
}
