import 'package:flutter/cupertino.dart';

class ParallelogramPainter extends CustomPainter {
  final Color color;
  final double edge;

  ParallelogramPainter({
    required this.color,
    required this.edge,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color=color
      ..style = PaintingStyle.fill;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x, edge)
      ..lineTo(x, 0)
      ..lineTo(0, y - edge);
  }

  @override
  bool shouldRepaint(ParallelogramPainter oldDelegate) {
    return true;
  }
}
