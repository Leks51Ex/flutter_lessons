import 'package:flutter/material.dart';

class AnimatedScalePage extends StatefulWidget {
  const AnimatedScalePage({super.key});

  @override
  State<AnimatedScalePage> createState() => _AnimatedScalePageState();
}

class _AnimatedScalePageState extends State<AnimatedScalePage> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedScale(
          curve: Curves.easeIn,
          scale: isAnimated ? 3 : 1.0,
          duration: Duration(milliseconds: 500),
          child: Container(width: 100, height: 100, color: Colors.red),
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
