import 'dart:async';

import 'package:flutter/material.dart';

import '../../feature/audio/model/audio_metadata.dart';
import '../../feature/audio/model/audio_player_state.dart';
import '../../feature/audio/model/audio_track.dart';
import '../../feature/audio/use_case/audio_meta_fetcher.dart';
import '../../feature/audio/use_case/audio_player.dart';
import '../model/file_source.dart';

class PlayingAudio with ChangeNotifier {
  AudioMetadata? _playingNow;
  final _playlist = <AudioTrack, AudioMetadata>{};
  AudioPlayer? player;
  AudioPlayerState? _state;
  StreamSubscription<AudioPlayerState>? _stateSubscription;

  PlayingAudio() {
    const assetTrack = AudioTrack(
      fileSource: FileSource.asset,
      filePath: 'assets/sample-audio-track.mp3',
    );
    addToPlaylist([assetTrack]);
  }

  AudioMetadata? get playingNow => _playingNow;

  AudioPlayerState get state => _state ?? AudioPlayerState();

  Iterable<AudioMetadata> get playlist => _playlist.values;

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
      });
      // playlist
      addToPlaylist([track]);
    }
    return player?.play() ?? Future.value();
  }

  Future<void> pause() {
    return player?.pause() ?? Future.value();
  }

  void addToPlaylist(Iterable<AudioTrack> tracks) {
    for (AudioTrack track in tracks) {
      // todo: add to player playlist
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
