

import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_model.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_view.dart';

class CounterPresenter {
  CounterView? _view;

  final CounterModel _counter;

  CounterPresenter({CounterView? view, required CounterModel model})
    : _view = view,
      _counter = model;

  int get counterValue => _counter.value;

  set view(CounterView? view) => _view = view;

  void increment() {
    _counter.value++;
    _view?.updateCounter(_counter.value);
  }

  void decrement() {
    _counter.value--;
    _view?.updateCounter(_counter.value);
  }
}
