import 'dart:async';

import 'package:just_audio/just_audio.dart' as just_audio;

import '../../../common/util/file_reader.dart';
import '../model/audio_player_state.dart';
import '../model/audio_track.dart';
import 'audio_player.dart';

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
    _emitStateWith(duration: duration);

    _audioPlayer.playingStream.listen((playing) {
      _emitStateWith(playing: playing);
    });

    _audioPlayer.positionStream.listen((position) {
      if (position.compareTo(_state.duration) > 0) {
        _emitStateWith(position: _state.duration);
      } else {
        _emitStateWith(position: position);
      }
    });

    _audioPlayer.playerStateStream.listen((state) {
      switch (state.processingState) {
        case just_audio.ProcessingState.ready:
          _emitStateWith(loading: false, canPlay: true);
          break;
        case just_audio.ProcessingState.idle:
          // TODO: Handle this case.
          break;
        case just_audio.ProcessingState.loading:
          _emitStateWith(loading: true, canPlay: false);
          break;
        case just_audio.ProcessingState.buffering:
          // TODO: Handle this case.
          break;
        case just_audio.ProcessingState.completed:
          _emitStateWith(playing: false);
          break;
      }
    });
  }

  void _emitStateWith({
    bool? loading,
    bool? canPlay,
    bool? playing,
    Duration? duration,
    Duration? position,
    String? error,
  }) {
    _state = AudioPlayerState(
      loading: loading ?? _state.loading,
      canPlay: canPlay ?? _state.canPlay,
      playing: playing ?? _state.playing,
      duration: duration ?? _state.duration,
      position: position ?? _state.position,
      error: error,
    );
    _controller.sink.add(_state);
  }

  @override
  Stream<AudioPlayerState> get stateStream => _controller.stream;

  @override
  Future<void> play() => _audioPlayer.play();

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
      contentType: 'audio/mpeg', // todo
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
