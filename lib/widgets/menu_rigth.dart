import 'package:challenges/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

class MenuRight extends StatelessWidget {
  const MenuRight({
    Key? key,
    required ValueNotifier<double> speed,
    required this.max,
  })  : _speed = speed,
        super(key: key);

  final ValueNotifier<double> _speed;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _InfoDistance(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Helpers.flagSVG,
                allowDrawingOutsideViewBox: true,
                color: Colors.blue,
                width: 12,
              ),
              const SizedBox(width: 3),
              Text(
                'Start',
                style: Helpers.txtmini,
              )
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 40,
            height: 200,
            child: ValueListenableBuilder<double>(
              valueListenable: _speed,
              builder: (_, value, __) {
                final percent = value / max;
                return CustomPaint(
                  painter: _InfoDistanceLinePainter(
                    percent: percent,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Helpers.pinSVG,
                allowDrawingOutsideViewBox: true,
                color: Colors.blue,
                width: 12,
              ),
              const SizedBox(width: 3),
              Text(
                'Finish',
                style: Helpers.txtmini,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoDistance extends StatelessWidget {
  const _InfoDistance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.30),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '5.8',
                    style: Helpers.txtDistanceKMStyle,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Km',
                    style: Helpers.txtKmhStyle,
                  ),
                ],
              ),
              Text(
                'Distance traveled',
                style: Helpers.txtmini,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 13,
          height: 9,
          child: CustomPaint(
            painter: const _TrianglePainter(color: Colors.white),
          ),
        )
      ],
    );
  }
}

class _InfoDistanceLinePainter extends CustomPainter {
  const _InfoDistanceLinePainter({this.percent = 0});
  final double percent;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    ///LINE INDICATOR
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    paint_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.5, 0), Offset(size.width * 0.5, size.height), [
      Colors.grey.withOpacity(0.3),
      Color(0xffff0000),
      Color(0xffff6600),
      Color(0xffc4ff00),
      Colors.blue
    ], [
      1 - percent,
      0.00,
      0.25,
      0.66,
      1.00
    ]);

    // LINE CURVES
    Path path_0 = Path();
    final center = size.width / 2;
    final d = (size.width * 0.2);
    final dA = center - d;
    final dB = center + d;
    final bloque = size.height / 10;
    path_0.moveTo(center, 0);
    path_0.quadraticBezierTo(dA, bloque * 1, center, bloque * 2);
    path_0.quadraticBezierTo(dB, bloque * 3, center, bloque * 4);
    path_0.quadraticBezierTo(dA, bloque * 5, center, bloque * 6);
    path_0.quadraticBezierTo(dB, bloque * 7, center, bloque * 8);
    path_0.quadraticBezierTo(dA, bloque * 9, center, bloque * 10);
    //CIRCULAR
    Paint paint_1 = new Paint()..color = Colors.red;
    Path path_1 = Path();
    path_1.addRRect(RRect.fromRectAndRadius(
        Rect.fromCircle(
            center: Offset(center, size.height - (size.height * percent)),
            radius: 10),
        Radius.circular(10)));

    canvas.drawPath(path_0, paint_0);
    canvas.drawShadow(path_1, Colors.red, 10.0, true);
    canvas.drawPath(path_1, paint_1);

    canvas.restore();
  }

  @override
  bool shouldRepaint(_InfoDistanceLinePainter oldDelegate) => false;
}

class _TrianglePainter extends CustomPainter {
  const _TrianglePainter({this.color = Colors.black});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    final path = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) => false;
}
