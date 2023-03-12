import 'audio_meta.dart';

class AudioMetaPlaylist {
  final List<AudioMeta> list;
  final bool loop;
  int _index;

  AudioMetaPlaylist({
    required this.list,
    this.loop = true,
    int index = 0,
  }) : _index = index {
    if (_index < 0 || _index >= list.length) {
      _index = 0;
    }
  }

  AudioMeta get current => list[_index];

  bool get advanceNext {
    _index += 1;
    if (_index >= list.length && loop) {
      _index = 0;
    }
    return _index < list.length;
  }
}
