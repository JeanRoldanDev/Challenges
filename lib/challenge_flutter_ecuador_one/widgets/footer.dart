import 'package:challenges/challenge_flutter_ecuador_one/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required ValueNotifier<double> speed,
  })  : _speed = speed,
        super(key: key);

  final ValueNotifier<double> _speed;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const _FooterBackgroundPainter(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _Gasoline(),
            ValueListenableBuilder<double>(
              valueListenable: _speed,
              builder: (_, value, __) {
                return _SpeedNumKm(km: value.toInt());
              },
            ),
            const _Temperature(),
          ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Helpers.stationSVG,
            width: 20,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.grey.shade400,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.grey.shade400,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
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
  final int km;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$km',
            style: Helpers.txtNumKmStyle,
          ),
          FittedBox(
            child: Text(
              'km/h',
              style: Helpers.txtKmhStyle,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Helpers.oilIndicatorSVG,
            width: 20,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          Text(
            '70°C',
            style: Helpers.txtDegreeCentigrade,
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
          Text(
            '100°C',
            style: Helpers.txtDegreeCentigrade,
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
    canvas.save();
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
    canvas.restore();
  }

  @override
  bool shouldRepaint(_FooterBackgroundPainter oldPainter) => false;
}
