extension NumberUtils on num {
  String format({int digits = 0, int fractionDigits = 0}) {
    final value = toStringAsFixed(fractionDigits);
    var pad = digits;
    if (fractionDigits > 0) {
      pad += fractionDigits + 1;
    }
    return value.padLeft(pad, '0');
  }
}
