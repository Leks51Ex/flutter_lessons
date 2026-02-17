import 'package:flutter/material.dart';

class HomeDeclScreen extends StatelessWidget {
  const HomeDeclScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('HomeScreen')),
        body: const Center(child: Text('HomeScreen')));
  }
}