import 'dart:async';

import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:mime/mime.dart';

import '../../../../common/util/file_reader.dart';
import '../../model/audio_player_state.dart';
import '../../model/audio_track.dart';
import '../audio_player.dart';

class JustAudioPlayer extends AudioPlayer {
  final AudioTrack track;
  final just_audio.AudioPlayer _audioPlayer;
  final StreamController<AudioPlayerState> _controller;
  late AudioPlayerState _state;

  JustAudioPlayer(this.track)
      : _audioPlayer = just_audio.AudioPlayer(),
        _controller = StreamController<AudioPlayerState>(),
        _state = AudioPlayerState() {
    _setupStream();
  }

  void _setupStream() async {
    final trackSource = AudioTrackSource(track);
    await _audioPlayer.setAudioSource(trackSource);

    final duration = await _audioPlayer.durationFuture;
    _emitState(duration: duration, volume: _audioPlayer.volume);

    _audioPlayer.playingStream.listen((playing) {
      _emitState(playing: playing);
    });

    _audioPlayer.positionStream.listen((position) {
      if (position.compareTo(_state.duration) > 0) {
        _emitState(position: _state.duration);
      } else {
        _emitState(position: position);
      }
    });

    _audioPlayer.volumeStream.listen((volume) {
      _emitState(volume: volume);
    });

    _audioPlayer.playerStateStream.listen(_handleState);
  }

  void _handleState(just_audio.PlayerState state) {
    switch (state.processingState) {
      case just_audio.ProcessingState.ready:
        _emitState(loading: false, canPlay: true);
        break;
      case just_audio.ProcessingState.idle:
        // TODO: Handle this case.
        break;
      case just_audio.ProcessingState.loading:
        _emitState(loading: true, canPlay: false);
        break;
      case just_audio.ProcessingState.buffering:
        // TODO: Handle this case.
        break;
      case just_audio.ProcessingState.completed:
        _emitState(playing: false, done: true);
        break;
    }
  }

  void _emitState({
    bool? loading,
    bool? canPlay,
    bool? playing,
    bool? done,
    Duration? duration,
    Duration? position,
    double? volume,
    String? error,
  }) {
    _state = AudioPlayerState(
      loading: loading ?? _state.loading,
      canPlay: canPlay ?? _state.canPlay,
      playing: playing ?? _state.playing,
      done: done ?? _state.done,
      duration: duration ?? _state.duration,
      position: position ?? _state.position,
      volume: volume ?? _state.volume,
      error: error,
    );
    _controller.sink.add(_state);
  }

  @override
  Stream<AudioPlayerState> get stateStream => _controller.stream;

  @override
  Future<void> play() {
    _emitState(done: false, playing: true);
    return _audioPlayer.play();
  }

  @override
  Future<void> pause() => _audioPlayer.pause();

  @override
  Future<void> stop() => _audioPlayer.stop();

  @override
  Future<void> dispose() async {
    await _controller.close();
    return _audioPlayer.dispose();
  }

  @override
  Future<void> seek(Duration duration) => _audioPlayer.seek(duration);

  @override
  Future<void> setVolume(double volume) => _audioPlayer.setVolume(volume);
}

class AudioTrackSource extends just_audio.StreamAudioSource {
  final AudioTrack track;
  int _trackLengthInBytes = -1;

  AudioTrackSource(this.track);

  @override
  Future<just_audio.StreamAudioResponse> request([int? start, int? end]) async {
    final length = await _trackLength();
    final stream = FileReader.read(track.filePath, track.fileSource);
    start ??= 0;
    end ??= length;
    return just_audio.StreamAudioResponse(
      sourceLength: length,
      contentLength: end - start,
      offset: start,
      stream: stream
          .map((buffer) => buffer.asInt8List(start!, end! - start).toList()),
      contentType: lookupMimeType(track.filePath) ?? 'audio/mpeg',
    );
  }

  Future<int> _trackLength() async {
    if (_trackLengthInBytes < 0) {
      _trackLengthInBytes =
          await FileReader.readBytesLength(track.filePath, track.fileSource);
    }
    return _trackLengthInBytes;
  }
}
