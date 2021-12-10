import 'package:flutter/rendering.dart';

class PathNavigationClipper extends CustomClipper<Path> {
  const PathNavigationClipper({
    required this.widthCenter,
    required this.borderRadius,
  });
  final double widthCenter;
  final double borderRadius;
  @override
  Path getClip(Size size) {
    final p1 = (size.width / 2) - (widthCenter / 2) - 13;
    final p2 = size.width / 2;
    final p3 = (size.width / 2) + (widthCenter / 2) + 13;

    final path = Path()
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..lineTo(p1, 0)
      ..lineTo(p2, widthCenter * 0.50)
      ..lineTo(p3, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, borderRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
