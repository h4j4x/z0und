import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/audio_meta.dart';
import '../model/playing_audio.dart';

/// Audio player.
abstract class AudioPlayer implements ChangeNotifier {
  static AudioPlayer of(BuildContext context, {bool listen = true}) =>
      Provider.of<AudioPlayer>(context, listen: listen);

  /// Gets loading audio.
  AudioMeta? get loadingAudio;

  /// Gets playing now audio.
  PlayingAudio? get playingNow;

  /// Gets playing position.
  Duration? get playingPosition;

  /// Plays given [audioMeta].
  Future play(AudioMeta audioMeta);

  /// Pauses active [playingNow].
  Future pause();

  /// Resumes active [playingNow].
  Future resume();

  /// Stops active [playingNow].
  Future stop();

  /// Plays next audio in playlist.
  Future playNext();
}
