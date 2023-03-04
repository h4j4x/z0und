import 'dart:convert';
import 'dart:math';

extension StringExtension on String {
  /// Returns this string encoded as base 64
  String encodeBase64() {
    final bytes = utf8.encode(this);
    return base64.encode(bytes);
  }
}

/// Generates a random string with alphanumeric characters of given [length].
String generateRandomString(int length) {
  final random = Random();
  const availableChars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();
}
