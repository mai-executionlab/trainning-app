import 'package:flutter/material.dart';

// class TriangleShape extends StatefulWidget {
//   const TriangleShape({
//     Key? key,
//     required this.color1,
//     required this.color2,
//     this.isBottom = true,
//   }) : super(key: key);
//   final Color color1;
//   final Color color2;
//   final bool isBottom;

//   @override
//   State<TriangleShape> createState() => _TriangleShapeState();
// }

// class _TriangleShapeState extends State<TriangleShape>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   late Animation<double> _curve;
//   late Animation<double> _animation1;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 1500))
//       ..repeat(reverse: true);
//     _curve = CurvedAnimation(
//         parent: _animationController, curve: Curves.easeInOutCubic);

//     _animation = Tween<double>(begin: 0, end: 1.0).animate(_curve)
//       ..addListener(() {
//         setState(() {});
//       });

//     _animation1 = Tween<double>(begin: 1.0, end: 0.0).animate(_curve)
//       ..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(
//       fit: StackFit.passthrough,
//       children: [
//         // CustomPaint(
//         //   painter:
//         //       TrianglePainter(color1: widget.color1, color2: widget.color2),
//         // ),
//         // Transform.translate(
//         // offset: const Offset(350, 150),
//         Positioned(
//           bottom: widget.isBottom ? size.height * _animation.value : 0,
//           left: widget.isBottom ? size.height * _animation.value : 0,
//           // right: !widget.isBottom ? size.height * _animation.value : 0,
//           // top: !widget.isBottom ? size.height * _animation.value : 0,
//           child: Transform.translate(
//             offset: Offset(
//                 widget.isBottom ? 0 : -400, widget.isBottom ? 400 : -400),
//             child: Transform.rotate(
//               angle: pi / 4,
//               origin: Offset.zero,
//               child: Transform.scale(
//                 scale: 1,
//                 origin: Offset.zero,
//                 child: Container(
//                   width: size.height,
//                   height: size.height,
//                   color: Colors.green.withOpacity(0.4),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // ),
//       ],
//     );
//   }
// }

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
