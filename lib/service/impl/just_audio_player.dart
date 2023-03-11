import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;

import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../../model/playing_audio.dart';
import '../audio_player.dart';
import '../data.dart';

/// Just audio integration.
///
/// * [Just audio documentation](https://pub.dev/packages/just_audio#tutorials)
class JustAudioPlayer extends ChangeNotifier implements AudioPlayer {
  final just_audio.AudioPlayer _player;
  AudioMeta? _loadingAudio;
  PlayingAudio? _playingNow;
  Duration? _playingPosition;

  JustAudioPlayer.create() : _player = just_audio.AudioPlayer() {
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

    return _play(audioMeta);
  }

  Future _play(AudioMeta audioMeta) async {
    final audioSource = await DataService().audioSourceOf(audioMeta);
    // todo: throw exception if audioSource == null

    final duration = await _loadAudioSource(audioSource!);
    // todo: throw exception if duration == null

    if (audioMeta.durationInSeconds != duration!.inSeconds) {
      audioMeta.durationInSeconds = duration.inSeconds;
      await DataService().saveAudioMeta(audioMeta);
    }

    await _player.stop();

    _loadingAudio = null;
    _playingNow = PlayingAudio(audioMeta);
    notifyListeners();

    return _player.play();
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
