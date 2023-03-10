import 'package:test/test.dart';
import 'package:z0und/helper/number.dart';

void main() {
  test('.format() should format', () {
    expect((2.0).format(digits: 2, fractionDigits: 2), '02.00');
    expect((2.0).format(digits: 3, fractionDigits: 1), '002.0');
    expect((2.2).format(digits: 1, fractionDigits: 3), '2.200');
    expect((222.2).format(digits: 1, fractionDigits: 3), '222.200');
    expect((2.2).format(digits: 2, fractionDigits: 0), '02');
  });
}
