import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MyCustomFinder extends Finder {
  final String textToFind;

  MyCustomFinder(this.textToFind);

  @override
  Iterable<Element> apply(Iterable<Element> candidates) {
    return candidates.where((element) {
      final widget = element.widget;
      if (widget is Text) {
        return widget.data == textToFind;
      }
      return false;
    });
  }

  @override
  String get description => 'Find text widget with textToFind';
}
