import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/benchmark.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_presenter.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_view.dart';


class MVPScreen extends StatefulWidget {
  final CounterPresenter _presenter;

  const MVPScreen({super.key, required CounterPresenter presenter})
    : _presenter = presenter;

  @override
  State<MVPScreen> createState() => _MVPScreenState();
}

class _MVPScreenState extends State<MVPScreen> implements CounterView {
  late final CounterPresenter _presenter;

  late int _counterValue;

  @override
  void initState() {
    super.initState();
    _presenter = widget._presenter;
    _counterValue = _presenter.counterValue;
    _presenter.view = this;
  }

  @override
  void updateCounter(int value) {
    setState(() {
      _counterValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(_counterValue.toString(), style: TextStyle(fontSize: 48)),
          SizedBox(height: 30),
          IconButton(
            onPressed: () async {
              await Benchmark.run(
                name: 'MVP',
                action: () async {
                  _presenter.increment();
                },
              );
            },
            icon: Icon(Icons.plus_one),
          ),
          SizedBox(height: 30),
          IconButton(
            onPressed: () {
              _presenter.decrement();
            },
            icon: Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
