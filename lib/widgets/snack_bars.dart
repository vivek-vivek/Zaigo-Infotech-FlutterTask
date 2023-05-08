import 'package:flutter/material.dart';

class CustomSnackBars {
  static SnackBar signup({
    required String content,
    Color textColor = Colors.redAccent,
    Color bgColor = Colors.black,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor,
      content: Text(
        content,
        style: TextStyle(color: textColor, letterSpacing: 0.5),
      ),
    );
  }
}
