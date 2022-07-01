import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/theme/colors.dart';

class ShapeBackgroundPainter extends CustomPainter {
  final Color color;
  final double delta;

  ShapeBackgroundPainter({
    this.color = AppColors.lightBlue,
    this.delta = 34,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(drawShapeBackground(size.width, size.height), paint);
  }

  Path drawShapeBackground(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x, y - delta)
      ..lineTo(x, 0);
  }

  @override
  bool shouldRepaint(ShapeBackgroundPainter oldDelegate) {
    return true;
  }
}
