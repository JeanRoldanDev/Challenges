import 'package:flutter/rendering.dart';

class PathHeaderClipper extends CustomClipper<Path> {
  PathHeaderClipper({
    required this.borderRadius,
  });

  final double borderRadius;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path()
      ..lineTo(w, 0)
      ..lineTo(w, h - borderRadius)
      ..quadraticBezierTo(w, h, w - borderRadius, h)
      ..lineTo(borderRadius, h)
      ..quadraticBezierTo(0, h, 0, h - borderRadius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
