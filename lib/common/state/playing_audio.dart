import 'dart:async';

import 'package:flutter/material.dart';

import '../../feature/audio/model/audio_metadata.dart';
import '../../feature/audio/model/audio_player_state.dart';
import '../../feature/audio/model/audio_track.dart';
import '../../feature/audio/use_case/audio_meta_fetcher.dart';
import '../../feature/audio/use_case/audio_player.dart';

class PlayingAudio with ChangeNotifier {
  AudioTrack? track;
  AudioMetadata? metadata;
  AudioPlayer? player;
  AudioPlayerState? _state;
  StreamSubscription<AudioPlayerState>? _stateSubscription;

  AudioPlayerState get state => _state ?? AudioPlayerState();

  Future<void> play({AudioTrack? track}) async {
    if (track != null && track != this.track) {
      this.track = track;
      player = AudioPlayer.create(this.track!);
      // metadata
      final fetcher = AudioMetaFetcher.create(this.track!);
      fetcher.metadata.then((value) {
        metadata = value;
        notifyListeners();
      });
      // state
      await _stateSubscription?.cancel();
      _stateSubscription = player!.stateStream.listen((playerState) {
        _state = playerState;
        notifyListeners();
      });
    }
    return player?.play() ?? Future.value();
  }

  Future<void> pause() {
    return player?.pause() ?? Future.value();
  }
}
