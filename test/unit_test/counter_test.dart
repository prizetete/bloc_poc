import 'package:flutter_test/flutter_test.dart';

void main() {
  late int counter;

  setUp(() {
    counter = 0;
  });

  tearDown(() {
    counter = 0;
  });

  group('Counter Tests', () {
    test('Initial value should be 0', () {
      expect(counter, 0);
    });

    test('Increment should add 1', () {
      counter++;
      expect(counter, 1);
      expect(counter.isOdd, true);
    });

    test('Decrement should subtract 1', () {
      counter--;
      expect(counter, -1);
      expect(counter.isOdd, true);
    });
  });
}
