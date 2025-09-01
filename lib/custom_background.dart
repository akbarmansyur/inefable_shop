import 'package:flutter/material.dart';
import 'package:inefable_shop/app_properties.dart';

class MainBackground extends CustomPainter {
  MainBackground();

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    canvas.drawRect(
      Rect.fromLTRB(width - (width / 3), 0, width, height),
      Paint()..color = transparentYellow,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
