import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/helpers.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required ValueNotifier<double> speed,
  })  : _speed = speed,
        super(key: key);

  final ValueNotifier<double> _speed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(.5),
          blurRadius: 50,
        ),
      ]),
      child: CustomPaint(
        painter: const _FooterBackgroundPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _Gasoline(),
              ValueListenableBuilder<double>(
                valueListenable: _speed,
                builder: (_, value, __) {
                  return _SpeedNumKm(km: value);
                },
              ),
              const _Temperature(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Gasoline extends StatelessWidget {
  const _Gasoline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Vectors.stationSVG,
            width: 20,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.grey.shade400,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.grey.shade400,
          ),
          SvgPicture.asset(
            Vectors.dropFillSVG,
            width: 13,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }
}

class _SpeedNumKm extends StatelessWidget {
  const _SpeedNumKm({
    Key? key,
    required this.km,
  }) : super(key: key);
  final double km;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            km.toStringAsFixed(2),
            style: TextStyles.txtNumKmStyle,
          ),
          const FittedBox(
            child: Text(
              'km/h',
              style: TextStyles.txtKmhStyle,
            ),
          ),
        ],
      ),
    );
  }
}

class _Temperature extends StatelessWidget {
  const _Temperature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Vectors.oilIndicatorSVG,
            width: 20,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          const Text(
            '70°C',
            style: TextStyles.txtDegreeCentigrade,
          ),
          Container(
            width: 70,
            height: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const Text(
            '100°C',
            style: TextStyles.txtDegreeCentigrade,
          ),
        ],
      ),
    );
  }
}

class _FooterBackgroundPainter extends CustomPainter {
  const _FooterBackgroundPainter({this.color = Colors.white}) : super();
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final heightCurve = size.height * 0.3;

    canvas.save();
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(0, heightCurve)
      ..quadraticBezierTo(
        size.width / 2,
        -heightCurve,
        size.width,
        heightCurve,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas
      ..drawPath(path, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(_FooterBackgroundPainter oldPainter) => false;
}
