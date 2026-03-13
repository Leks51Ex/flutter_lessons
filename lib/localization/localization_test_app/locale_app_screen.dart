import 'package:flutter/material.dart';

class LocaleAppScreen extends StatefulWidget {
  final VoidCallback onLocaleToggle;

  const LocaleAppScreen({super.key, required this.onLocaleToggle});

  @override
  State<LocaleAppScreen> createState() => _LocaleAppScreenState();
}

class _LocaleAppScreenState extends State<LocaleAppScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
