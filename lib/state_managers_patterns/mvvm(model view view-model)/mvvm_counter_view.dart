import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/benchmark.dart';
import 'package:flutter_stepik/state_managers_patterns/mvvm(model%20view%20view-model)/mvvm_counter_view_model.dart';


class MvvmCounterView extends StatelessWidget {
  final MvvmCounterViewModel viewModel;

  const MvvmCounterView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListenableBuilder(
        builder: (context, _) {
          return Column(
            children: [
              Text(
                viewModel.counter.toString(),
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 30),
              IconButton(
                onPressed: () async {
                  await Benchmark.run(
                    name: 'MVVM',
                    action: () async {
                      viewModel.increment();
                    },
                  );
                },
                icon: Icon(Icons.plus_one),
              ),
              SizedBox(height: 30),
              IconButton(
                onPressed: () {
                  viewModel.decrement();
                },
                icon: Icon(Icons.exposure_minus_1_outlined),
              ),
            ],
          );
        },
        listenable: viewModel,
      ),
    );
  }
}
