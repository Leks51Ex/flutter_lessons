
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';
    return Scaffold(
      body: Center(
        child: Text(args.toString()),
      ),
    );
  }
}

