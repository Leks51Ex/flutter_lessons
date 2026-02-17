import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/benchmark.dart';
import 'package:flutter_stepik/state_managers_patterns/mvc(model%20view%20controller)/mvc_counter_controller.dart';

class MVCScreen extends StatefulWidget {
  final MvcCounterController _controller;

  const MVCScreen({super.key, required MvcCounterController controller})
    : _controller = controller;

  @override
  State<MVCScreen> createState() => _MVCScreenState();
}

class _MVCScreenState extends State<MVCScreen> {
  late final MvcCounterController _controller;

  @override
  void initState() {
    _controller = widget._controller;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(_controller.counter.toString(), style: TextStyle(fontSize: 48)),
          SizedBox(height: 30),
          IconButton(
            onPressed: () async {
              await Benchmark.run(
                name: 'MVC',
                action: () async {
                  setState(() {
                    _controller.increment();
                  });
                },
              );
            },
            icon: Icon(Icons.plus_one),
          ),
          SizedBox(height: 30),
          IconButton(
            onPressed: () {
              setState(() {
                _controller.decrement();
              });
            },
            icon: Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
