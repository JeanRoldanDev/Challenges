import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DecoratedBox(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF19223A),
            Color(0xFF29425c),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.elasticOut,
                      child: _Header(),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: (1 - value).clamp(0.0, 1.0),
                          child: Transform.translate(
                            offset: Offset(0.0, -150 * value),
                            child: child,
                          ),
                        );
                      }),
                ),
                Expanded(
                  flex: 4,
                  child: _Indicator(),
                ),
                Expanded(
                  flex: 2,
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.bounceOut,
                      child: _Buttons(),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: 1 - value,
                          child: Transform.translate(
                            offset: Offset(0.0, 100 * value),
                            child: child,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Temperature',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w200,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Living room',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  final randomNumber = Random().nextInt(50) + 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: randomNumber),
            duration: const Duration(milliseconds: 1300),
            curve: Curves.decelerate,
            builder: (context, value, _) {
              return CustomPaint(
                painter: _IndicatorPainter(value),
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${value.toString()}°C',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _IndicatorPainter extends CustomPainter {
  final int percent;

  _IndicatorPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF76619b)
      ..strokeWidth = 3.5;
    final max = 80.0;
    final angle = 2 * pi / max;
    final radius = size.width / 2;
    final lineHeight = 30.0;
    canvas.translate(radius, radius);
    for (int i = 0; i < percent; i++) {
      canvas.save();
      canvas.rotate(-angle * i);
      canvas.drawLine(
          Offset(0.0, -radius), Offset(0.0, -radius + lineHeight), paint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _IndicatorPainter oldDelegate) => true;
}

class _Buttons extends StatelessWidget {
  Widget _buildButton(String title, List<Color> colors) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(height: 16);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton('Choice', const [
            Color(0xFFB1509F),
            Color(0xFF64CAE9),
          ]),
          separator,
          _buildButton('Timer', const [
            Color(0xFFE73295),
            Color(0xFFE95862),
          ]),
          separator,
          _buildButton('Later', const [
            Color(0xFFDF5B33),
            Color(0xFFE7B83A),
          ]),
        ],
      ),
    );
  }
}
