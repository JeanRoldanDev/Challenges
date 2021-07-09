import 'package:flutter/material.dart';

class KmInfo extends CustomPainter {
  KmInfo({this.color = Colors.white}) : super();
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    var path = Path();
    var heightCurve = size.height * 0.3;
    path.moveTo(0, heightCurve);
    path.quadraticBezierTo(
      size.width / 2,
      -heightCurve,
      size.width,
      heightCurve,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(KmInfo oldPainter) => true;
}
