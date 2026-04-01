import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(microseconds: 500),
          curve: Curves.easeIn,
          color: isAnimated ? Colors.red : Colors.blue,
          width: isAnimated ? 300 : 100,
          height: isAnimated ? 300 : 100,
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
