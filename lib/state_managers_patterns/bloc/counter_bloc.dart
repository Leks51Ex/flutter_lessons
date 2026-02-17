import 'dart:async';

import 'package:flutter_stepik/state_managers_patterns/bloc/counter_bloc_event.dart';
import 'package:flutter_stepik/state_managers_patterns/bloc/counter_bloc_state.dart';

class CounterBloc {
  BlocState _state = BlocState(0);
  BlocState get state => _state;

  // State stream
  final _stateController = StreamController<BlocState>.broadcast();
  Stream<BlocState> get stream => _stateController.stream;

  // Event stream

  final _eventController = StreamController<BlocEvent>.broadcast();

  // Event subscription

  late StreamSubscription _eventSubscription;

  CounterBloc() {
    _eventSubscription = _eventController.stream.listen(_mapEventToState);
  }

  void add(BlocEvent event) {
    _eventController.add(event);
  }

  void _mapEventToState(BlocEvent event) {
    switch (event) {
      case BlocEvent.increment:
        final count = _state.count + 1;
        _saveAndUpdateState(count);
      case BlocEvent.decrement:
        final count = _state.count - 1;
        _saveAndUpdateState(count);
    }
  }

  void _saveAndUpdateState(int count) {
    final newState = BlocState(count);
    _stateController.add(newState);
    _state = newState;
  }

  void dispose() {
    _stateController.close();
    _eventController.close();
    _eventSubscription.cancel();
  }
}
