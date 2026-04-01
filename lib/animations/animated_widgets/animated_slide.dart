import 'package:flutter/material.dart';

class AnimatedSlidePage extends StatefulWidget {
  const AnimatedSlidePage({super.key});

  @override
  State<AnimatedSlidePage> createState() => _AnimatedSlidePageState();
}

class _AnimatedSlidePageState extends State<AnimatedSlidePage> {
  bool isAnimated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSlide(
          offset: isAnimated ? Offset(0, 0) : Offset(5, 0),
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 10000),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(color: Colors.red, width: 4.0),
            ),
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
