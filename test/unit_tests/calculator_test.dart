import 'package:flutter_stepik/tests/calculator_app/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator tests', () {
    final calculator = Calculator();

    setUpAll(() async {
      await calculator.init();
    });

    test('Add test', () {
      final result = calculator.add(2, 3);
      expect(result, equals('5'));
      expect(calculator.lastValue, equals('5'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });
    test('Substract test', () {
      final result = calculator.subtract(3, 2);
      expect(result, equals('1'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Multiply test', () {
      final result = calculator.multiply(3, 2);
      expect(result, equals('6'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Devide test', () {
      final result = calculator.divide(6, 2);
      expect(result, equals('3.0'));
      print('Elapsed time: ${calculator.timer.elapsedMilliseconds} ms');
    });

    test('Devide test(zero exception)', () {
      expect(() => calculator.divide(6, 0), throwsA(isA<ArgumentError>()));
    });
  });
}
