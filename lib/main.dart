import 'package:challenges/helper.dart';
import 'package:challenges/kminfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: TweenAnimationBuilderDemo(),
    );
  }
}

const List<int> kms = <int>[
  0,
  50,
  100,
  150,
  200,
  250,
  300,
  350,
  400,
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<double> _speed = ValueNotifier<double>(200);

  @override
  Widget build(BuildContext context) {
    final items = kms.length;
    final step = ((220 * math.pi) / 180) / (items - 1);
    final gradual = ((20 * math.pi) / 180);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //HEADER
            Container(
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight,
              color: Colors.blue,
            ),
            //BODY
            Expanded(
              child: Row(
                children: [
                  //BAR_LEFT
                  Container(
                    width: 100,
                    color: Colors.red,
                  ),
                  //SPEEDOMETER
                  Expanded(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final minWidth =
                            constraints.maxWidth.clamp(300, 400).toDouble();
                        final textWidth = 30.0;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            //NUMBERS SPEEDOMETER
                            ...List.generate(
                              items,
                              (index) {
                                return Transform.translate(
                                  offset: Offset(
                                    -((minWidth - textWidth) /
                                        2 *
                                        math.cos((step * (index)) - gradual)),
                                    -((minWidth - textWidth) /
                                        2 *
                                        math.sin((step * (index)) - gradual)),
                                  ),
                                  child: Container(
                                    width: textWidth,
                                    height: textWidth / 2,
                                    alignment: Alignment.center,
                                    child: FittedBox(
                                      child: Text(
                                        '${kms[index]}',
                                        style: Helpers.txtSpeedometerStyle,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            //SPEEDOMETER
                            AnimatedBuilder(
                              animation: _speed,
                              builder: (_, __) {
                                return Container(
                                  width: minWidth - (textWidth * 1.8),
                                  height: minWidth - (textWidth * 1.8),
                                  child: CustomPaint(
                                    painter: _Speedometer(
                                      kmh: _speed.value,
                                      radioMark: 7,
                                      radioMarkWidth: 0.65,
                                    ),
                                  ),
                                );
                              },
                            ),

                            /// ANIMAR
                            Positioned(
                              bottom: 0,
                              child: SizedBox(
                                width: 200,
                                child: ValueListenableBuilder(
                                  valueListenable: _speed,
                                  builder: (BuildContext context, dynamic value,
                                      Widget? child) {
                                    return Slider(
                                      value: _speed.value,
                                      min: 0,
                                      max: 400,
                                      label: _speed.value.round().toString(),
                                      onChanged: (double value) {
                                        _speed.value = value;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  //BAR_RIGHT
                  Container(
                    width: 80,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            //FOOTHER
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              color: Colors.grey,
              child: CustomPaint(
                painter: KmInfo(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Speedometer extends CustomPainter {
  _Speedometer({
    required this.kmh,
    required this.radioMark,
    required this.radioMarkWidth,
  });
  final double kmh;
  final double radioMark;
  final double radioMarkWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final maximo = kms.reduce(math.max);
    final gradekm = (kmh * 220) / maximo;
    final gradual = ((gradekm * math.pi) / 180);

    //CIRCLE RADIUS
    final radius = size.width / 2;

    //=============================GRADIENTE===================================
    canvas.save();
    final paint = Paint();
    paint.color = Colors.blue.withOpacity(0.50);
    //DEGRADED CIRCLE
    paint.shader = RadialGradient(
      colors: [
        Colors.blue,
        Colors.white,
      ],
      stops: [0.1, 0.5],
      focal: Alignment.center,
      center: Alignment.center,
    ).createShader(
      Rect.fromCircle(
        center: Offset(radius, radius),
        radius: size.width,
      ),
    );

    final initalGrade = -((200 * math.pi) / 180);
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.width),
      initalGrade,
      gradual,
      true,
      paint,
    );
    canvas.restore();
    //=============================MARKET===================================
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(initalGrade);
    final paintMark = new Paint();

    paintMark.shader = RadialGradient(
      colors: [
        Colors.blue.shade600,
        Colors.blue.shade300,
      ],
      stops: [0.2, 0.9],
      focal: Alignment.center,
      center: Alignment.center,
    ).createShader(
      Rect.fromCircle(
        center: Offset(0, 0),
        radius: (radius * radioMarkWidth) - (radioMark / 2),
      ),
    );

    final path = Path();
    path.addArc(
      Rect.fromCircle(
        center: Offset((radius * radioMarkWidth) - (radioMark / 2), 0),
        radius: (radioMark / 2),
      ),
      ((90 * math.pi) / 180),
      -((180 * math.pi) / 180),
    );
    path.lineTo(-0, -radioMark);
    path.lineTo(0, radioMark);
    path.close();
    canvas.rotate(gradual);
    canvas.drawPath(path, paintMark);
    canvas.restore();

    //=============================LINES SPEEDOMETER===========================
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(-((110 * math.pi) / 180));

    final Paint paintLines = Paint();
    paintLines.color = Colors.blue;
    //TOTAL ITEMS
    final int tickCount = kms.length;
    //TOTAL ITEMS + LINES INTERNAL
    final int tickCountInternal = 8;
    final total = (tickCountInternal * (tickCount - 1)) + tickCount;
    final degreesTotal = (220 * math.pi) / 180;

    double cont = 0;
    for (int i = 0; i < kms.length; ++i) {
      final RRect line =
          RRect.fromLTRBXY(0, -(radius - 0), 3, -(radius - 20), 5, 5);
      canvas.drawRRect(line, paintLines);
      canvas.rotate(degreesTotal / total);
      cont += (degreesTotal / total);
      paintLines.color =
          gradual < cont ? Colors.grey : _getColor(i / (kms.length - 1));
      if (i < (tickCount - 1)) {
        for (var eje = 1; eje <= tickCountInternal; eje++) {
          final RRect line =
              RRect.fromLTRBXY(0, -(radius - 7), 1, -(radius - 20), 5, 5);
          canvas.drawRRect(line, paintLines);
          canvas.rotate(degreesTotal / total);
          cont += (degreesTotal / total);
          paintLines.color =
              gradual < cont ? Colors.grey : _getColor(i / (kms.length - 1));
        }
      }
    }
    canvas.restore();

    // =============================CENTER===================================
    canvas.save();
    canvas.translate(radius, radius);
    final paintCenter = new Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), radioMark * 1.8, paintCenter);
    final paintCenter2 = new Paint()
      ..color = Colors.blue.shade800
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, 0), (radioMark / 1.5), paintCenter2);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Color _getColor(value) {
    final double hue = ((1 - value) * 120);
    return HSLColor.fromAHSL(1, hue, 1, 0.40).toColor();
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 50,
      child: Container(
        width: 80,
        height: 250,
        color: Colors.red,
      ),
    );
  }
}
