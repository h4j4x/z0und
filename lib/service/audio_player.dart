import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:provider/provider.dart';

import '../model/audio_meta.dart';

/// Audio player.
abstract class AudioPlayer implements ChangeNotifier {
  static AudioPlayer create() => JustAudioPlayer._();

  static AudioPlayer of(BuildContext context, {bool listen = true}) =>
      Provider.of<AudioPlayer>(context, listen: listen);

  /// Gets playing now audio.
  AudioMeta? get playingNow;

  /// Plays given [audioMeta].
  Future play(AudioMeta audioMeta);

  /// Pause active [playingNow].
  Future pause();

  /// Stop active [playingNow].
  Future stop();

  /// Plays next audio in playlist.
  Future playNext();
}

/// Just audio integration.
///
/// * [Just audio documentation](https://pub.dev/packages/just_audio#tutorials)
class JustAudioPlayer extends ChangeNotifier implements AudioPlayer {
  final just_audio.AudioPlayer _player;
  AudioMeta? _playingNow;

  JustAudioPlayer._() : _player = just_audio.AudioPlayer();

  @override
  AudioMeta? get playingNow => _playingNow;

  @override
  Future play(AudioMeta audioMeta) {
    // todo
    _playingNow = audioMeta;
    notifyListeners();
    return Future.value(null);
  }

  @override
  Future pause() {
    // todo
    return Future.value(null);
  }

  @override
  Future stop() {
    // todo
    _playingNow = null;
    notifyListeners();
    return Future.value(null);
  }

  @override
  Future playNext() {
    // todo
    return Future.value(null);
  }
}
