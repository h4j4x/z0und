import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/routes.dart';
import '../../../common/state/playing_audio.dart';
import '../../../common/util/duration_utils.dart';
import '../../audio/model/audio_metadata.dart';
import '../use_case/track_picker.dart';

class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  static const maxWidth = 600.0;
  static const paddingSize = 22.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Stack(
        children: [
          listView(),
          Positioned(
            bottom: paddingSize,
            right: paddingSize,
            child: FloatingActionButton(
              onPressed: onPickTracks,
              child: const Icon(Icons.add_sharp),
            ),
          ),
        ],
      ),
    );
  }

  void onPickTracks() async {
    final tracks = await TrackPicker.create().pickTracks();
    if (mounted) {
      final playingNow = context.read<PlayingAudio>();
      playingNow.addToPlaylist(tracks);
    }
  }

  Widget listView() {
    return Consumer<PlayingAudio>(builder: (context, playingAudio, _) {
      return ListView.builder(
        itemCount: playingAudio.playlist.length,
        itemBuilder: (context, index) => trackListItem(
          context,
          playingAudio.playlist.elementAt(index),
          playingAudio,
        ),
      );
    });
  }

  Widget trackListItem(
    BuildContext context,
    AudioMetadata metadata,
    PlayingAudio playingAudio,
  ) {
    IconData actionIcon;
    final active = playingAudio.playingNow == metadata;
    if (active && playingAudio.state.playing) {
      actionIcon = Icons.pause_circle_sharp;
    } else {
      actionIcon = Icons.play_circle_sharp;
    }

    Widget trackTime;
    if (metadata == playingAudio.playingNow) {
      trackTime = Text(
        playingAudio.state.position.minutesFormatted(),
        textScaleFactor: 0.8,
        style: const TextStyle(
          fontWeight: FontWeight.w200,
        ),
      );
    } else {
      trackTime = Container();
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: ListTile(
        selected: active,
        title: Text(metadata.title),
        subtitle: Text(metadata.album),
        onTap: () {
          Navigator.of(context).pushNamed(Routes.audioPlayer);
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            trackTime,
            IconButton(
              icon: Icon(actionIcon),
              onPressed: () => onPlay(metadata),
            ),
          ],
        ),
      ),
    );
  }

  void onPlay(AudioMetadata metadata) {
    final playingAudio = context.read<PlayingAudio>();
    if (playingAudio.playingNow == metadata && playingAudio.state.playing) {
      playingAudio.pause();
    } else {
      playingAudio.play(track: metadata.track);
    }
  }
}
