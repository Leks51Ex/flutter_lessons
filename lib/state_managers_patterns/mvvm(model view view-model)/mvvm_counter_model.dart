// Модель, управляющая данными счетчика
class MvvmCounterModel {
  int _counter;

  MvvmCounterModel(this._counter);

  int get counter => _counter;

  void increment() {
    _counter++;
  }

  void decrement() {
    _counter--;
  }
}
