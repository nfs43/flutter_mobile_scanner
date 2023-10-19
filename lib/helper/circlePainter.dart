
import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double percentage;
  final double strokeWidth; // Adjust the thickness of the circle

  CirclePainter({required this.percentage,required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey // Adjust the color of the circle background
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint fillPaint = Paint()
      ..color = Colors.white// Adjust the color of the filled border
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - strokeWidth / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}