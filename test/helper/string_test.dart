import 'package:test/test.dart';
import 'package:z0und/helper/string.dart';

void main() {
  group('StringExtension', () {
    test('.encodeBase64() returns string encoded as base64', () {
      const stringsBase64 = <String, String>{
        'stringA': 'c3RyaW5nQQ==',
        'stringB': 'c3RyaW5nQg==',
        'stringC': 'c3RyaW5nQw==',
      };
      stringsBase64.forEach((string, expectedBase64) {
        final base64 = string.encodeBase64();
        expect(base64, equals(expectedBase64));
      });
    });
  });

  test('generateRandomString() returns random string of given length', () {
    const lengths = <int>[1, 10, 20, 30, 100];
    for (var length in lengths) {
      final randomString = generateRandomString(length);
      expect(randomString.length, equals(length));
    }
  });
}
