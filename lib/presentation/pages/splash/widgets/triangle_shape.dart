import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color1;
  final Color color2;

  TrianglePainter({
    required this.color1,
    required this.color2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = LinearGradient(
        end: Alignment.topRight,
        begin: Alignment.bottomLeft,
        colors: [
          color1,
          color2,
        ],
      ).createShader(
          Rect.fromPoints(Offset(0, size.width), Offset(size.width, 0)))
      // ..color = strokeColor
      // ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x, 0)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color1 != color1 || oldDelegate.color2 != color2;
  }
}
