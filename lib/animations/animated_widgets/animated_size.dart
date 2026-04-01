import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  const AnimatedSizePage({super.key});

  @override
  State<AnimatedSizePage> createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSize(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeIn,
          child: SizedBox(
            width: isAnimated ? 300 : 100,
            height: isAnimated ? 300 : 100,
            child: ColoredBox(color: Colors.red),
          ),
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
