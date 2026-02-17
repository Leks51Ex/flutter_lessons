
import 'package:flutter_stepik/state_managers_patterns/mvc(model%20view%20controller)/mvc_counter_model.dart';

class MvcCounterController {
  final MvcCounterModel _model;
  MvcCounterController(this._model);

  int get counter => _model.counter;

  void increment() {
    _model.increment();
  }

  void decrement() {
    _model.decrement();
  }
}
