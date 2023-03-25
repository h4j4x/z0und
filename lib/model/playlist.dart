class Playlist<T> {
  final List<T> list;
  final bool loop;
  int _index;

  Playlist({
    required this.list,
    this.loop = true,
    int index = 0,
  }) : _index = index {
    if (_index < 0 || _index >= list.length) {
      _index = 0;
    }
  }

  T get current => list[_index];

  bool advance(int step) {
    var nextIndex = _index + step;
    while (nextIndex < 0 && loop) {
      nextIndex += list.length;
    }
    while (nextIndex >= list.length && loop) {
      nextIndex -= list.length;
    }
    final isValid = nextIndex >= 0 && nextIndex < list.length;
    if (isValid) {
      _index = nextIndex;
    }
    return isValid;
  }
}
