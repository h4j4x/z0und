import 'number.dart';

extension DurationExtension on Duration {
  /// Formats duration as minutes : seconds
  String minutesFormatted({String separator = ' : '}) {
    final minutes = inMinutes;
    final seconds = inSeconds % 60;
    return '${minutes.format(digits: 2)}$separator${seconds.format(digits: 2)}';
  }
}
