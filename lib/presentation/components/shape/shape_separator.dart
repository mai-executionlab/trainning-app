import 'package:flutter/cupertino.dart';
import 'package:training_app/presentation/theme/colors.dart';

class ShapeSeparatorPainter extends CustomPainter {
  final Color color;
  final double thickness;

  ShapeSeparatorPainter({
    this.color = AppColors.lightBlue,
    this.thickness = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(drawShapeSeparator(size.width, size.height), paint);
  }

  Path drawShapeSeparator(double x, double y) {
    return Path()
      ..moveTo(0, y-thickness)
      ..lineTo(0, y)
      ..lineTo(x, thickness)
      ..lineTo(x, 0);
  }

  @override
  bool shouldRepaint(ShapeSeparatorPainter oldDelegate) {
    return true;
  }
}
