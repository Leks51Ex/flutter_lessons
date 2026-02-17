import 'package:flutter/material.dart';

class HomeDataScreen extends StatelessWidget {
  const HomeDataScreen({super.key, this.date});

  final String? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(date ?? 'Нет переданных данных'),
      ),
    );
  }
}