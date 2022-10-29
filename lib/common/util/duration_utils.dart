import 'number_utils.dart';

extension DurationUtils on Duration {
  String minutesFormatted({String separator = ' : '}) {
    final minutes = inMinutes;
    final seconds = inSeconds % 60;
    return '${minutes.format(digits: 2)}$separator${seconds.format(digits: 2)}';
  }
}
