import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/mvvm(model%20view%20view-model)/mvvm_counter_model.dart';

class MvvmCounterViewModel extends ChangeNotifier {
  final MvvmCounterModel _counterModel;

  MvvmCounterViewModel(this._counterModel);

  int get counter => _counterModel.counter;

  void increment() {
    _counterModel.increment();
    notifyListeners();
  }

  void decrement() {
    _counterModel.decrement();
    notifyListeners();
  }
}
