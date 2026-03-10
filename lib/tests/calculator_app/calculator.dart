///mmini-app for tests

class Calculator {
  String lastValue = 'не определено!';
  late Stopwatch timer;

  Future<void> init() async {
    timer = Stopwatch()..start();
    await Future.delayed(Duration(seconds: 5));
    print('Инициализация завершена');
  }

  String add(int a, int b) {
    lastValue = (a + b).toString();
    return lastValue;
  }

  String subtract(int a, int b) {
    lastValue = (a - b).toString();
    return lastValue;
  }

  String multiply(int a, int b) {
    lastValue = (a * b).toString();
    return lastValue;
  }

  /// Если b == 0, вернем ошибку.
  String divide(int a, int b) {
    if (b == 0) {
      lastValue = 'Ошибка';
      throw ArgumentError('На ноль делить нельзя');
    }
    lastValue = (a / b).toString();
    return lastValue;
  }
}
