import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:provider/provider.dart';

import '../handler/audio_meta_handler.dart';
import '../model/audio_meta.dart';
import '../model/audio_source.dart';

/// Audio player.
abstract class AudioPlayer implements ChangeNotifier {
  static AudioPlayer create() => JustAudioPlayer._();

  static AudioPlayer of(BuildContext context, {bool listen = true}) =>
      Provider.of<AudioPlayer>(context, listen: listen);

  /// Gets playing now audio.
  AudioMeta? get playingNow;

  /// Gets playing now position.
  Duration? get playingNowPosition;

  /// Gets loading now audio.
  AudioMeta? get loadingNow;

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
  AudioMeta? _loadingNow;
  Duration? _playingNowPosition;

  JustAudioPlayer._() : _player = just_audio.AudioPlayer() {
    _player.positionStream.listen((position) {
      _playingNowPosition = position;
      notifyListeners();
    });
  }

  @override
  AudioMeta? get playingNow => _playingNow;

  @override
  Duration? get playingNowPosition => _playingNowPosition;

  @override
  AudioMeta? get loadingNow => _loadingNow;

  @override
  Future play(AudioMeta audioMeta) async {
    if (_loadingNow == null) {
      _loadingNow = audioMeta;
      notifyListeners();

      final audioSource = await AudioMetaHandler.fetchSource(audioMeta);
      // todo: exception if audioSource == null
      if (audioSource != null) {
        final duration = await _loadAudioSource(audioSource);
        // todo: exception if duration == null
        if (duration != null) {
          await _player.stop();
          audioMeta.durationInSeconds = duration.inSeconds;
          // todo: update audioMeta in database
          _playingNow = audioMeta;
          _loadingNow = null;
          _player.play();
          notifyListeners();
        }
      }
    }
    return Future.value(null);
  }

  Future<Duration?> _loadAudioSource(AudioSource audioSource) {
    if (audioSource.sourceType == AudioSourceType.url) {
      return _player.setUrl(audioSource.source);
    }
    // todo
    return Future.value(null);
  }

  @override
  Future pause() => _player.pause();

  @override
  Future stop() async {
    await _player.stop();
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
