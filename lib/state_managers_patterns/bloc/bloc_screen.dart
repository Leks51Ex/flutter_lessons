import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/benchmark.dart';
import 'package:flutter_stepik/state_managers_patterns/bloc/counter_bloc.dart';
import 'package:flutter_stepik/state_managers_patterns/bloc/counter_bloc_event.dart';
import 'package:flutter_stepik/state_managers_patterns/bloc/counter_bloc_state.dart';


class BlocScreenCounter extends StatefulWidget {
  const BlocScreenCounter({super.key});

  @override
  State<BlocScreenCounter> createState() => _BlocScreenCounterState();
}

class _BlocScreenCounterState extends State<BlocScreenCounter> {
  final CounterBloc _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<BlocState>(
        stream: _bloc.stream,
        builder: (_, __) {
          return Column(
            children: [
              Text('${_bloc.state.count}', style: TextStyle(fontSize: 48)),
              SizedBox(height: 30),
              IconButton(
                onPressed: () async {
                  await Benchmark.run(
                    name: 'BLOC',
                    action: () async {
                      _bloc.add(BlocEvent.increment);
                    },
                  );
                },
                icon: Icon(Icons.plus_one_sharp),
              ),
              SizedBox(height: 30),
              IconButton(
                onPressed: () => _bloc.add(BlocEvent.decrement),
                icon: Icon(Icons.exposure_minus_1_outlined),
              ),
            ],
          );
        },
      ),
    );
  }
}
