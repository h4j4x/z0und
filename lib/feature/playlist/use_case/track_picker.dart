import '../../audio/model/audio_track.dart';

abstract class TrackPicker {
  Future<List<AudioTrack>> pickTracks();
}
