import 'package:flutter/material.dart';
import 'package:z0und/feature/audio/model/audio_track.dart';

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
      child: Center(child: listView()),
    );
  }

  Widget listView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) => trackListItem(
        context,
        list[index],
      ),
    );
  }

  Widget trackListItem(BuildContext context, AudioTrack track) {
    return ListTile(
      title: Text(track.filePath),
      trailing: IconButton(
        icon: const Icon(Icons.play_arrow_sharp),
        onPressed: () {},
      ),
    );
  }
}
