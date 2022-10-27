import 'number_utils.dart';

extension DurationUtils on Duration {
  String minutesFormatted() {
    final minutes = inMinutes;
    final seconds = inSeconds % 60;
    return '${minutes.format(digits: 2)} : ${seconds.format(digits: 2)}';
  }
}
