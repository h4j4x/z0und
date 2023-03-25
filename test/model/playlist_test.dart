import 'package:test/test.dart';
import 'package:z0und/model/playlist.dart';

void main() {
  test('.advance() with loop sets valid index and return true', () {
    final list = List<int>.generate(10, (i) => i + 1);
    final playlist = Playlist<int>(list: list);
    final steps = <Tuple<int>>[
      Tuple<int>(-1, 10),
      Tuple<int>(1, 1),
      Tuple<int>(1, 2),
      Tuple<int>(8, 10),
      Tuple<int>(2, 2),
      Tuple<int>(-3, 9),
    ];
    for (var step in steps) {
      expect(playlist.advance(step.left), isTrue);
      expect(playlist.current, step.right);
    }
  });

  test('.advance() without loop preserves valid index', () {
    final list = List<int>.generate(10, (i) => i + 1);
    final playlist = Playlist<int>(list: list, loop: false);
    final steps = <Triple<int, bool>>[
      Triple<int, bool>(-1, 1, false),
      Triple<int, bool>(1, 2, true),
      Triple<int, bool>(8, 10, true),
      Triple<int, bool>(2, 10, false),
      Triple<int, bool>(-2, 8, true),
      Triple<int, bool>(-7, 1, true),
      Triple<int, bool>(-1, 1, false),
    ];
    for (var step in steps) {
      expect(playlist.advance(step.left), equals(step.third));
      expect(playlist.current, step.right);
    }
  });
}

class Tuple<T> {
  final T left;
  final T right;

  Tuple(this.left, this.right);
}

class Triple<T, E> extends Tuple<T> {
  final E third;

  Triple(super.left, super.right, this.third);
}
