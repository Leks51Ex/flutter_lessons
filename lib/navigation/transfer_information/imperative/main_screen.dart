import 'package:flutter/material.dart';
import 'package:flutter_stepik/navigation/transfer_information/imperative/screen_1.dart';
import 'package:flutter_stepik/navigation/transfer_information/imperative/screen_2.dart';
import 'package:flutter_stepik/navigation/transfer_information/imperative/test_data.dart';

class ImperativeTransferDataScreen extends StatelessWidget{
  const ImperativeTransferDataScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Передать императивно данные на другой экран',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const Screen1();
                    },
             
                    settings: const RouteSettings(
                      arguments: 'Переданные данные из ImperativeScreen',
                    ),
                  ));
                },
                child: const Text('Передать строку')),
            const SizedBox(height: 12),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const Screen2();
                    },
                    settings: RouteSettings(
                      arguments: TestData(data: 'Тестовые данные'),
                    ),
                  ));
                },
                child: const Text('Передать объект')),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}