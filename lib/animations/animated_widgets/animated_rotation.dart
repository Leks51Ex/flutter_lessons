import 'package:flutter/material.dart';

class AnimatedRotationPage extends StatefulWidget {
  const AnimatedRotationPage({super.key});

  @override
  State<AnimatedRotationPage> createState() => _AnimatedRotationPageState();
}

class _AnimatedRotationPageState extends State<AnimatedRotationPage> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeIn,
          turns: isAnimated ? 10 : 1.0,
          duration: Duration(milliseconds: 500),
          child: Container(width: 5, height: 300, color: Colors.red),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isAnimated = !isAnimated;
          });
        },
      ),
    );
  }
}
