import 'package:just_audio/just_audio.dart' as just_audio;

import '../../../common/util/file_reader.dart';
import '../model/audio_player_state.dart';
import '../model/audio_track.dart';
import 'audio_player.dart';

class JustAudioPlayer extends AudioPlayer {
  final AudioTrack track;
  just_audio.AudioPlayer? _audioPlayer;
  Duration? _duration;

  JustAudioPlayer(this.track);

  Future<void> _init() async {
    if (_audioPlayer == null) {
      _audioPlayer = just_audio.AudioPlayer();
      final trackSource = AudioTrackSource(track);
      await _audioPlayer!.setAudioSource(trackSource);
    }
  }

  @override
  Stream<AudioPlayerState> stateStream() {
    if (_audioPlayer != null) {
      return _audioPlayer!.playerStateStream.map(_parseState);
    }
    return const Stream.empty();
  }

  @override
  Stream<Duration> positionStream() {
    if (_audioPlayer != null) {
      return _audioPlayer!.positionStream.map((position) {
        final duration = _duration ?? Duration.zero;
        if (position.compareTo(duration) > 0) {
          return duration;
        }
        return position;
      });
    }
    return const Stream.empty();
  }

  AudioPlayerState _parseState(just_audio.PlayerState state) {
    final playerState = AudioPlayerState();
    playerState.playing = state.playing;
    switch (state.processingState) {
      case just_audio.ProcessingState.ready:
        playerState.canPlay = true;
        break;
      case just_audio.ProcessingState.idle:
        // TODO: Handle this case.
        break;
      case just_audio.ProcessingState.loading:
        // TODO: Handle this case.
        break;
      case just_audio.ProcessingState.buffering:
        // TODO: Handle this case.
        break;
      case just_audio.ProcessingState.completed:
        playerState.playing = false;
        break;
    }
    return playerState;
  }

  @override
  Future<Duration?> fetchDuration() async {
    if (_duration == null) {
      await _init();
      _duration = await _audioPlayer!.durationFuture;
    }
    return _duration;
  }

  @override
  Future<void> play() async {
    await _init();
    return _audioPlayer!.play();
  }

  @override
  Future<void> pause() async {
    await _init();
    return _audioPlayer!.pause();
  }

  @override
  Future<void> seek(Duration duration) async {
    await _init();
    return _audioPlayer!.seek(duration);
  }
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
