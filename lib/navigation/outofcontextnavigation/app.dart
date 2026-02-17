import 'package:flutter/material.dart';
import 'package:flutter_stepik/main.dart';

class OutOfContextNavApp extends StatelessWidget {
  const OutOfContextNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Out of context navigation'),),
    body: Center(
      child: ElevatedButton(onPressed: (){
        navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (context)=> _SecondScreen())
        );
      }, child: Text('Go to second page')),
    ),
    );
    
  }
} 



class _SecondScreen extends StatelessWidget {
  const _SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          navigatorKey.currentState?.pop();
        }, child: Text('Go back')),
      ),
    );
  }
}