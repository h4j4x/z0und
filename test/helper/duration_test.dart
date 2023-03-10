import 'package:test/test.dart';
import 'package:z0und/helper/duration.dart';

void main() {
  test('.minutesFormatted() should format', () {
    final map = <Duration, String>{
      const Duration(seconds: 38): '00:38',
      const Duration(seconds: 60): '01:00',
      const Duration(seconds: 69): '01:09',
      const Duration(seconds: 169): '02:49',
      const Duration(seconds: 480): '08:00',
    };
    for (var key in map.keys) {
      expect(key.minutesFormatted(separator: ':'), map[key]);
    }
  });
}
