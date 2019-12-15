import 'dart:ui';
import 'package:flutter/material.dart';

class DrawingPainter extends CustomPainter {
  List<Offset> offsetPoints = List();
List<Offset> tapPoints = List();
  DrawingPainter(this.offsetPoints);

  var _paint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.white
    ..strokeWidth = 10
  ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < offsetPoints.length - 1; i++) {
      if (offsetPoints[i] != null && offsetPoints[i + 1] != null) {
        canvas.drawLine(
            offsetPoints[i], offsetPoints[i + 1], _paint);
      }else if (offsetPoints[i] != null && offsetPoints[i+1] == null) {
        tapPoints.clear();
        tapPoints.add(offsetPoints[i]);
        canvas.drawPoints(PointMode.points, tapPoints,_paint);

      }
      }
    }


  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
