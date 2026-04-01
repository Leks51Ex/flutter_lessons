import 'package:flutter/material.dart';

class CustomStaggeredAnimatedContainer extends StatefulWidget {
  const CustomStaggeredAnimatedContainer({super.key});

  @override
  State<CustomStaggeredAnimatedContainer> createState() =>
      _CustomStaggeredAnimatedContainerState();
}

class _CustomStaggeredAnimatedContainerState
    extends State<CustomStaggeredAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late Animation<double> _heightAnimation;
  late Animation<double> _widthAnimation;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _animated = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    _heightAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.6, curve: Curves.easeInOut),
      ),
    );
    _widthAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1, curve: Curves.easeInOut),
      ),
    );
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1, curve: Curves.easeInOut),
      ),
    );

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.completed:
        case AnimationStatus.reverse:
          setState(() {
            _animated = true;
          });
        case AnimationStatus.dismissed:
        case AnimationStatus.forward:
          setState(() {
            _animated = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: _colorAnimation.value,
          width: 100 + _heightAnimation.value,
          height: 100 + _heightAnimation.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_animated) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
      ),
    );
  }
}
