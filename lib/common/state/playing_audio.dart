import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../feature/audio/model/audio_metadata.dart';
import '../../feature/audio/model/audio_player_state.dart';
import '../../feature/audio/model/audio_track.dart';
import '../../feature/audio/use_case/audio_meta_fetcher.dart';
import '../../feature/audio/use_case/audio_player.dart';
import '../model/file_source.dart';
import '../model/playlist_next_mode.dart';
import '../util/collection_utils.dart';

class PlayingAudio with ChangeNotifier {
  PlaylistNextMode _playlistNextMode;
  AudioMetadata? _playingNow;
  final _playlist = <AudioTrack, AudioMetadata>{};
  AudioPlayer? player;
  AudioPlayerState? _state;
  StreamSubscription<AudioPlayerState>? _stateSubscription;

  PlayingAudio({required PlaylistNextMode playlistNextMode})
      : _playlistNextMode = playlistNextMode {
    const assetTrack = AudioTrack(
      fileSource: FileSource.asset,
      filePath: 'assets/sample-audio-track.mp3',
    );
    addToPlaylist([assetTrack]);
  }

  AudioMetadata? get playingNow => _playingNow;

  AudioPlayerState get state => _state ?? AudioPlayerState();

  Iterable<AudioMetadata> get playlist => _playlist.values;

  PlaylistNextMode get playlistNextMode => _playlistNextMode;

  set playlistNextMode(PlaylistNextMode nextMode) {
    _playlistNextMode = nextMode;
    notifyListeners();
  }

  int get _nowIndex => _playlist.indexOfValue(playingNow);

  Future<void> play({AudioTrack? track}) async {
    if (track != null && track != _playingNow?.track) {
      // stop current
      await player?.stop();
      await player?.dispose();
      // play new track
      final fetcher = AudioMetaFetcher.create(track);
      _playingNow = fetcher.initial;
      player = AudioPlayer.create(_playingNow!.track);
      // state
      await _stateSubscription?.cancel();
      _stateSubscription = player!.stateStream.listen((playerState) {
        _state = playerState;
        notifyListeners();
        if (playerState.done) {
          _playNext();
        }
      });
      // playlist
      addToPlaylist([track]);
    }
    return player?.play() ?? Future.value();
  }

  Future<void> pause() {
    return player?.pause() ?? Future.value();
  }

  void _playNext() {
    int nextIndex = -1;
    switch (_playlistNextMode) {
      case PlaylistNextMode.repeat:
        player?.seek(Duration.zero);
        player?.play();
        break;
      case PlaylistNextMode.random:
        final random = Random();
        final nowIndex = _nowIndex;
        nextIndex = nowIndex;
        while (nextIndex == nowIndex) {
          nextIndex = random.nextInt(_playlist.length);
        }
        break;
      case PlaylistNextMode.doNotLoop:
        nextIndex = _nowIndex + 1;
        break;
      case PlaylistNextMode.loop:
        nextIndex = (_nowIndex + 1) % _playlist.length;
        break;
    }
    if (nextIndex >= 0 && nextIndex < _playlist.length) {
      play(track: _playlist.keys.elementAt(nextIndex));
    }
  }

  void addToPlaylist(Iterable<AudioTrack> tracks) {
    for (AudioTrack track in tracks) {
      final fetcher = AudioMetaFetcher.create(track);
      _playlist[track] = fetcher.initial;
      notifyListeners();
      fetcher.metadata.then((metadata) {
        _playlist[track] = metadata;
        notifyListeners();
      });
    }
  }
}
