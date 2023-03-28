import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart' as just_audio;

import '../../model/audio_meta.dart';
import '../../model/audio_source.dart';
import '../../model/playing_state.dart';
import '../../model/playlist.dart';
import '../audio_info.dart';
import '../audio_player.dart';
import '../data.dart';
import '../storage.dart';

const _loopStorageKey = 'AUDIO_PLAYER_LOOP';

/// Just audio integration.
///
/// * [Just audio documentation](https://pub.dev/packages/just_audio#tutorials)
class JustAudioPlayer extends ChangeNotifier implements AudioPlayer {
  final just_audio.AudioPlayer _player;

  Playlist<AudioMeta>? _playlist;
  PlayingState? _playingState;
  Duration? _playingPosition;
  bool _loadingNext = false;
  bool _loop = true;

  static Future<JustAudioPlayer> create() async {
    final loop = await StorageService().readBool(_loopStorageKey);
    return JustAudioPlayer._create(loop ?? true);
  }

  JustAudioPlayer._create(bool loop) : _player = just_audio.AudioPlayer() {
    _player.positionStream.listen((position) {
      _playingPosition = position;
      notifyListeners();
    });
    _player.playerStateStream.listen(_updateState);
    _loop = loop;
  }

  @override
  AudioMeta? get playingNow => _playlist?.current;

  @override
  bool get isLoading => _playingState == PlayingState.loading;

  @override
  bool get isPlaying => _playingState == PlayingState.playing;

  @override
  bool get isPaused => _playingState == PlayingState.paused;

  @override
  Duration? get playingPosition => _playingPosition;

  @override
  bool get loop => _loop;

  @override
  void toggleLoop() {
    _loop = !_loop;
    StorageService().writeBool(_loopStorageKey, _loop);
    if (_playlist != null) {
      _playlist = Playlist.from(_playlist!, loop: _loop);
    }
    notifyListeners();
  }

  @override
  Future play(List<AudioMeta> playlist, int index) async {
    if (_playingState == PlayingState.loading) {
      return Future.value(null);
    }
    final isSameAudioActive = _playlist?.current == playlist[index];

    _playlist = Playlist<AudioMeta>(list: playlist, loop: loop, index: index);
    notifyListeners();

    if (!isSameAudioActive) {
      _playingState = PlayingState.loading;
      _playingPosition = Duration.zero;
      notifyListeners();

      _player.stop();
      await _loadAudioMeta(_playlist!.current);
    }

    return _player.play();
  }

  Future _loadAudioMeta(AudioMeta audioMeta) async {
    final audioSource = await DataService().audioSourceOf(audioMeta);
    if (audioSource == null) {
      throw AudioSourceNotAvailableException();
    }
    try {
      audioMeta.duration = await _loadAudioSource(audioSource);
      if (audioMeta.duration == null) {
        throw AudioSourceNotValidException();
      }
      if (audioMeta.title == null) {
        final audioInfo = await AudioInfoService().fetchAudioInfo(audioSource);
        audioInfo?.update(audioMeta);
      }
      DataService().saveAudioMeta(audioMeta);
    } catch (error) {
      debugPrint('JustAudioPlayer error: $error');
      throw AudioSourceNotValidException();
    }
    return Future.value(null);
  }

  Future<Duration?> _loadAudioSource(AudioSource audioSource) {
    if (audioSource.sourceType == AudioSourceType.file) {
      return _player.setFilePath(audioSource.source);
    }
    return Future.value(null);
  }

  void _updateState(just_audio.PlayerState state) {
    final isReady = state.processingState == just_audio.ProcessingState.ready;
    final isCompleted =
        state.processingState == just_audio.ProcessingState.completed;
    if (isReady && state.playing) {
      _loadingNext = false;
      _playingState = PlayingState.playing;
    } else if (isReady || isCompleted) {
      _playingState = PlayingState.paused;
    } else if (state.processingState != just_audio.ProcessingState.idle) {
      _playingState = PlayingState.loading;
    } else {
      _playingState = null;
    }
    notifyListeners();
    if (isCompleted && !_loadingNext) {
      _loadingNext = true;
      playNext();
    }
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
    _playlist = null;
    _playingState = null;
    notifyListeners();
    return Future.value(null);
  }

  @override
  Future playPrevious() => _advancePlay(-1);

  @override
  Future playNext() => _advancePlay(1);

  @override
  Future togglePlay() {
    if (isPlaying) {
      return pause();
    }
    return resume();
  }

  @override
  Future seek(Duration position) => _player.seek(position);

  Future _advancePlay(int step) async {
    final nowPlaying = playingNow;
    if (_playlist?.advance(step) == true && playingNow != nowPlaying) {
      _playingState = null;
      _playingPosition = Duration.zero;
      notifyListeners();

      _player.stop();
      notifyListeners();

      await _loadAudioMeta(_playlist!.current);
      return _player.play();
    }
    return Future.value(null);
  }

  @override
  Future dispose() async {
    await _player.dispose();
    return super.dispose();
  }
}
