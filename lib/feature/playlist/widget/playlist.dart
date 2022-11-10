import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state/playing_audio.dart';
import '../../audio/model/audio_track.dart';
import '../use_case/track_picker.dart';

class PlaylistWidget extends StatefulWidget {
  final List<AudioTrack> list;

  const PlaylistWidget({
    super.key,
    required this.list,
  });

  @override
  State<StatefulWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  static const maxWidth = 600.0;
  static const paddingSize = 22.0;

  final list = <AudioTrack>[];

  @override
  void initState() {
    super.initState();
    list.addAll(widget.list);
  }

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
              onPressed: () async {
                final tracks = await TrackPicker.create().pickTracks();
                setState(() {
                  list.addAll(tracks);
                });
              },
              child: const Icon(Icons.add_sharp),
            ),
          ),
        ],
      ),
    );
  }

  Widget listView() {
    final playingNow = context.watch<PlayingAudio>();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => trackListItem(
        context,
        list[index],
        playingNow,
      ),
    );
  }

  Widget trackListItem(
    BuildContext context,
    AudioTrack track,
    PlayingAudio playingAudio,
  ) {
    IconData icon;
    if (playingAudio.track == track && playingAudio.state.playing) {
      icon = Icons.pause_circle_sharp;
    } else {
      icon = Icons.play_circle_sharp;
    }
    return ListTile(
      title: Text(track.filePath),
      trailing: IconButton(
        icon: Icon(icon),
        onPressed: () => onPlay(track),
      ),
    );
  }

  void onPlay(AudioTrack track) {
    final playingAudio = context.read<PlayingAudio>();
    if (playingAudio.track == track && playingAudio.state.playing) {
      playingAudio.pause();
    } else {
      playingAudio.play(track: track);
    }
  }
}
