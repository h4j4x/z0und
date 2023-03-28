import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/audio_meta.dart';

/// Audio player.
abstract class AudioPlayer implements ChangeNotifier {
  static AudioPlayer of(BuildContext context, {bool listen = true}) =>
      Provider.of<AudioPlayer>(context, listen: listen);

  /// Gets playing now audio.
  AudioMeta? get playingNow;

  /// Gets player is loading.
  bool get isLoading;

  /// Gets player is playing.
  bool get isPlaying;

  /// Gets player is paused.
  bool get isPaused;

  /// Gets playing position.
  Duration? get playingPosition;

  /// Gets [loop] enabled;
  bool get loop;

  /// Toggles [loop] value;
  void toggleLoop();

  /// Plays given [index] inside [playlist].
  Future play(List<AudioMeta> playlist, int index);

  /// Pauses active [playingNow].
  Future pause();

  /// Resumes active [playingNow].
  Future resume();

  /// Stops active [playingNow].
  Future stop();

  /// Plays previous audio in playlist.
  Future playPrevious();

  /// Plays next audio in playlist.
  Future playNext();

  /// Pauses or resumes active [playingNow].
  Future togglePlay();

  /// Seeks to a particular [position] in active [playingNow].
  Future seek(Duration position);
}

class AudioSourceNotAvailableException implements Exception {}

class AudioSourceNotValidException implements Exception {}
