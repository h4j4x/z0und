import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:provider/provider.dart';

import '../model/audio_meta.dart';
import '../model/audio_source.dart';
import '../model/playing_audio.dart';
import 'data.dart';

/// Audio player.
abstract class AudioPlayer implements ChangeNotifier {
  static AudioPlayer create() => JustAudioPlayer._();

  static AudioPlayer of(
    BuildContext context, {
    bool listen = true,
  }) =>
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

/// Just audio integration.
///
/// * [Just audio documentation](https://pub.dev/packages/just_audio#tutorials)
class JustAudioPlayer extends ChangeNotifier implements AudioPlayer {
  final just_audio.AudioPlayer _player;
  AudioMeta? _loadingAudio;
  PlayingAudio? _playingNow;
  Duration? _playingPosition;

  JustAudioPlayer._() : _player = just_audio.AudioPlayer() {
    _player.positionStream.listen((position) {
      _playingPosition = position;
      notifyListeners();
    });
    _player.playerStateStream.listen((state) {
      final isReady = state.processingState == just_audio.ProcessingState.ready;
      if (isReady && state.playing) {
        _playingNow?.state = PlayingState.playing;
      } else if (isReady ||
          state.processingState == just_audio.ProcessingState.completed) {
        _playingNow?.state = PlayingState.paused;
      }
      notifyListeners();
    });
  }

  @override
  AudioMeta? get loadingAudio => _loadingAudio;

  @override
  PlayingAudio? get playingNow => _playingNow;

  @override
  Duration? get playingPosition => _playingPosition;

  @override
  Future play(AudioMeta audioMeta) async {
    if (_loadingAudio != null) {
      return Future.value(null);
    }
    if (_playingNow?.audioMeta == audioMeta) {
      return _player.play();
    }

    _loadingAudio = audioMeta;
    notifyListeners();

    final audioSource = await DataService().audioSourceOf(audioMeta);
    // todo: exception if audioSource == null
    if (audioSource != null) {
      final duration = await _loadAudioSource(audioSource);
      // todo: exception if duration == null
      if (duration != null) {
        if (audioMeta.durationInSeconds != duration.inSeconds) {
          audioMeta.durationInSeconds = duration.inSeconds;
          await DataService().saveAudioMeta(audioMeta);
        }
        _loadingAudio = null;
        _playingNow = PlayingAudio(audioMeta);
        notifyListeners();

        await _player.stop();
        return _player.play();
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
  Future resume() async {
    if (_player.processingState == just_audio.ProcessingState.completed) {
      await _player.seek(Duration.zero);
    }
    return _player.play();
  }

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
