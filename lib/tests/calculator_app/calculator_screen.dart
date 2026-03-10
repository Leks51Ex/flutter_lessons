import 'package:flutter/material.dart';
import 'package:flutter_stepik/tests/calculator_app/calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  final _calculator = Calculator();

  String _result = '';

  void _calculate(String operation) {
    final a = int.tryParse(_controllerA.text) ?? 0;
    final b = int.tryParse(_controllerB.text) ?? 0;

    _result = switch (operation) {
      '+' => _calculator.add(a, b),
      '-' => _calculator.subtract(a, b),
      '*' => _calculator.multiply(a, b),
      '/' => _calculator.divide(a, b),
      _ => 'неизвестная операция',
    };
    setState(() {});
  }

  @override
  void dispose() {
    _controllerA.dispose();
    _controllerB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controllerA,
              decoration: InputDecoration(labelText: 'Первое число'),
            ),
            TextField(
              controller: _controllerB,
              decoration: InputDecoration(labelText: 'Второе число'),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Результат: $_result'),
          ],
        ),
      ),
    );
  }
}
