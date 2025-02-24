import 'package:flutter/material.dart';

class SegmentedProgressPainter extends CustomPainter {
  final Color color;
  final bool curved;

  SegmentedProgressPainter({
    required this.color,
    required this.curved,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final segmentWidth = size.width;
    final radius = size.height / 2;

    if (curved) {
      path.moveTo(0, 0);
      path.lineTo(segmentWidth - radius, 0);
      path.arcToPoint(
        Offset(segmentWidth - radius, size.height),
        radius: Radius.circular(radius),
        rotation: 90,
      );
      path.lineTo(0, size.height);

      // Left connection curve
      path.quadraticBezierTo(
        radius,
        size.height / 2,
        0,
        0,
      );
    } else {
      path.addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, segmentWidth, size.height),
          Radius.circular(radius),
        ),
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
