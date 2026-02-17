import 'package:flutter/material.dart';
import 'package:flutter_stepik/state_managers_patterns/change_notifier/notifier.dart';

class MyWidgetNot extends StatelessWidget {
  const MyWidgetNot({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeExample notifier = ChangeExample();
    return Center(
      child: ListenableBuilder(
        builder: (BuildContext context, widget) {
          return Column(
            children: [
              Container(child: Text(notifier.status)),
              TextField(
                onChanged: (String text) {
                  notifier.setStatus(text);
                },
              ),
            ],
          );
        },
        listenable: notifier,
      ),
    );
  }
}
