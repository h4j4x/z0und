import 'package:just_audio/just_audio.dart' as just_audio;

import '../../../common/util/file_reader.dart';
import '../model/audio_player_state.dart';
import '../model/audio_track.dart';
import 'audio_player.dart';

class JustAudioPlayer extends AudioPlayer {
  final AudioTrack track;
  just_audio.AudioPlayer? _audioPlayer;

  JustAudioPlayer(this.track);

  Future<void> _init() async {
    if (_audioPlayer == null) {
      _audioPlayer = just_audio.AudioPlayer();
      final trackSource = AudioTrackSource(track);
      await _audioPlayer!.setAudioSource(trackSource);
      _audioPlayer!.playerStateStream.listen(_onState);
    }
  }

  void _onState(just_audio.PlayerState state) {
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
        // TODO: Handle this case.
        break;
    }
    notifyListeners(playerState);
  }

  @override
  Future<Duration?> fetchDuration() async {
    await _init();
    return _audioPlayer!.durationFuture;
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
