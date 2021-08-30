import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/helpers.dart';

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
        children: [
          const _InfoDistance(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Vectors.flagSVG,
                allowDrawingOutsideViewBox: true,
                color: Colors.blue,
                width: 12,
              ),
              const SizedBox(width: 3),
              const Text(
                'Start',
                style: TextStyles.txtmini,
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
            children: [
              SvgPicture.asset(
                Vectors.pinSVG,
                allowDrawingOutsideViewBox: true,
                color: Colors.blue,
                width: 12,
              ),
              const SizedBox(width: 3),
              const Text(
                'Finish',
                style: TextStyles.txtmini,
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
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    '5.8',
                    style: TextStyles.txtDistanceKMStyle,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Km',
                    style: TextStyles.txtKmhStyle,
                  ),
                ],
              ),
              const Text(
                'Distance traveled',
                style: TextStyles.txtmini,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 13,
          height: 9,
          child: CustomPaint(
            painter: _TrianglePainter(color: Colors.white),
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
    final paint_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6
      ..shader = ui.Gradient.linear(
          Offset(size.width * 0.5, 0),
          Offset(
            size.width * 0.5,
            size.height,
          ),
          [
            Colors.grey.withOpacity(0.3),
            const Color(0xffff0000),
            const Color(0xffff6600),
            const Color(0xffc4ff00),
            Colors.blue
          ],
          [
            1 - percent,
            0.00,
            0.25,
            0.66,
            1.00
          ]);

    // LINE CURVES
    final path_0 = Path();
    final center = size.width / 2;
    final d = size.width * 0.2;
    final dA = center - d;
    final dB = center + d;
    final bloque = size.height / 10;
    path_0
      ..moveTo(center, 0)
      ..quadraticBezierTo(dA, bloque * 1, center, bloque * 2)
      ..quadraticBezierTo(dB, bloque * 3, center, bloque * 4)
      ..quadraticBezierTo(dA, bloque * 5, center, bloque * 6)
      ..quadraticBezierTo(dB, bloque * 7, center, bloque * 8)
      ..quadraticBezierTo(dA, bloque * 9, center, bloque * 10);
    //CIRCULAR
    final paint_1 = Paint()..color = Colors.red;
    final path_1 = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromCircle(
              center: Offset(center, size.height - (size.height * percent)),
              radius: 10),
          const Radius.circular(10),
        ),
      );

    canvas
      ..drawPath(path_0, paint_0)
      ..drawShadow(path_1, Colors.red, 10, true)
      ..drawPath(path_1, paint_1)
      ..restore();
  }

  @override
  bool shouldRepaint(_InfoDistanceLinePainter oldDelegate) => false;
}

class _TrianglePainter extends CustomPainter {
  const _TrianglePainter({this.color = Colors.black});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path()
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) => false;
}
