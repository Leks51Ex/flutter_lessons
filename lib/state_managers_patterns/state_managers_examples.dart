import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/bloc/bloc_screen.dart';
import 'package:flutter_stepik/state_managers_patterns/mvc(model%20view%20controller)/mvc_counter_controller.dart';
import 'package:flutter_stepik/state_managers_patterns/mvc(model%20view%20controller)/mvc_counter_model.dart';
import 'package:flutter_stepik/state_managers_patterns/mvc(model%20view%20controller)/mvc_screen.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_model.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/counter_presenter.dart';
import 'package:flutter_stepik/state_managers_patterns/mvp(model%20view%20presenter)/mvp_screen.dart';
import 'package:flutter_stepik/state_managers_patterns/mvvm(model%20view%20view-model)/mvvm_counter_model.dart';
import 'package:flutter_stepik/state_managers_patterns/mvvm(model%20view%20view-model)/mvvm_counter_view.dart';
import 'package:flutter_stepik/state_managers_patterns/mvvm(model%20view%20view-model)/mvvm_counter_view_model.dart';


class StateManagerExamples extends StatelessWidget {
  const StateManagerExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Text(
                "by MVP(model view presenter)",
                style: TextStyle(fontSize: 40),
              ),
              MVPScreen(presenter: CounterPresenter(model: CounterModel(0))),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Text("by BLOC", style: TextStyle(fontSize: 40)),
              BlocScreenCounter(),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Text(
                "by MVC(model view controller)",
                style: TextStyle(fontSize: 40),
              ),
              MVCScreen(controller: MvcCounterController(MvcCounterModel())),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              Text(
                "by MVVM(model view view-model)",
                style: TextStyle(fontSize: 40),
              ),
              MvvmCounterView(
                viewModel: MvvmCounterViewModel(MvvmCounterModel(0)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
