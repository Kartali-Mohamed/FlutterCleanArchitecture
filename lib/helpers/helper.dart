import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenTextScaleFactor => MediaQuery.of(this).textScaleFactor;
  EdgeInsets get screenPadding => MediaQuery.of(this).padding;
}

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void pushAndRemoveUntil(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget), (route) => false);
  }
}
