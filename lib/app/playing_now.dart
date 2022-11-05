import 'package:flutter/material.dart';

import '../feature/audio/model/audio_metadata.dart';
import '../feature/audio/model/audio_track.dart';
import '../feature/audio/use_case/audio_player.dart';

class PlayingAudio with ChangeNotifier {
  AudioTrack? playingNow;
  AudioMetadata? playingNowMeta;
  AudioPlayer? player;
  bool isPlaying = false; //fixme: use audio state

  Future<void> play({AudioTrack? track}) {
    if (track != null && track != playingNow) {
      playingNow = track;
      player = AudioPlayer.create(playingNow!);
    }
    if (player != null) {
      isPlaying = true;
      notifyListeners();
      return player!.play();
    }
    return Future.value();
  }

  Future<void> pause() {
    if (player != null) {
      isPlaying = false;
      notifyListeners();
      return player!.pause();
    }
    return Future.value();
  }
}
