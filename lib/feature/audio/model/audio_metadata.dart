import 'package:equatable/equatable.dart';

import 'audio_track.dart';

class AudioMetadata with EquatableMixin {
  final AudioTrack track;
  final String title;
  final String album;

  AudioMetadata({
    required this.track,
    required this.title,
    required this.album,
  });

  @override
  List<Object?> get props => [track];
}
