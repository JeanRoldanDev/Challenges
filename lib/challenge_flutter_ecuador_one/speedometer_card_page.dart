import 'package:challenges/challenge_flutter_ecuador_one/helper.dart';
import 'package:challenges/challenge_flutter_ecuador_one/widgets/footer.dart';
import 'package:challenges/challenge_flutter_ecuador_one/widgets/header.dart';
import 'package:challenges/challenge_flutter_ecuador_one/widgets/menu_left.dart';
import 'package:challenges/challenge_flutter_ecuador_one/widgets/menu_rigth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

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

class SpeedometerCardPage extends StatefulWidget {
  SpeedometerCardPage({Key? key}) : super(key: key);
  @override
  _SpeedometerCardPageState createState() => _SpeedometerCardPageState();
}

class _SpeedometerCardPageState extends State<SpeedometerCardPage> {
  ValueNotifier<double> _speed = ValueNotifier<double>(130);

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (!kIsWeb) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        SystemChrome.setEnabledSystemUIOverlays([]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = kms.length;
    final step = ((220 * math.pi) / 180) / (items - 1);
    final gradual = ((20 * math.pi) / 180);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            //HEADER
            const HeaderTop(),
            //BODY
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //SPEEDOMETER
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final minWidth =
                              constraints.maxWidth.clamp(300, 450).toDouble();

                          final textWidth = 30.0;
                          return Container(
                            width: minWidth,
                            height: constraints.maxHeight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // ICON BMW
                                Car(width: minWidth / 2),
                                // ICON BMW
                                Positioned(
                                  top: 60,
                                  child: Image.asset(
                                    Helpers.bmwLogoImg,
                                    width: 30,
                                  ),
                                ),

                                //NUMBERS SPEEDOMETER
                                if (kIsWeb)
                                  ...List.generate(
                                    items,
                                    (index) {
                                      return Transform.translate(
                                        offset: Offset(
                                          -((minWidth - textWidth) /
                                              2 *
                                              math.cos(
                                                  (step * (index)) - gradual)),
                                          -((minWidth - textWidth) /
                                              2 *
                                              math.sin(
                                                  (step * (index)) - gradual)),
                                        ),
                                        child: Container(
                                          width: textWidth,
                                          height: textWidth / 2,
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            child: Text(
                                              '${kms[index]}',
                                              style:
                                                  Helpers.txtSpeedometerStyle,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                //SPEEDOMETER
                                if (kIsWeb)
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
                                  )
                                else
                                  AnimatedBuilder(
                                      animation: _speed,
                                      builder: (_, __) {
                                        return Container(
                                          width: minWidth,
                                          height: constraints.maxHeight,
                                          alignment: Alignment.bottomCenter,
                                          child:
                                              LayoutBuilder(builder: (_, ct) {
                                            final wmin =
                                                (ct.maxWidth / 4) + textWidth;
                                            return Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  width: constraints.maxHeight,
                                                  height: constraints.maxHeight,
                                                  margin: EdgeInsets.only(
                                                      top: textWidth),
                                                  child: CustomPaint(
                                                    painter: _Speedometer(
                                                      kmh: _speed.value,
                                                      radioMark: 7,
                                                      radioMarkWidth: 0.65,
                                                    ),
                                                  ),
                                                ),
                                                ...List.generate(
                                                  items,
                                                  (index) {
                                                    final cos = wmin *
                                                        math.cos(
                                                            (step * index) -
                                                                gradual);
                                                    final sen = wmin *
                                                        math.sin(
                                                            (step * index) -
                                                                gradual);

                                                    return Container(
                                                      margin: EdgeInsets.only(
                                                        top: (textWidth * 2),
                                                      ),
                                                      child:
                                                          Transform.translate(
                                                        offset:
                                                            Offset(-cos, -sen),
                                                        child: Container(
                                                          width: textWidth,
                                                          height: textWidth / 2,
                                                          alignment:
                                                              Alignment.center,
                                                          child: FittedBox(
                                                            child: Text(
                                                              '${kms[index]}',
                                                              style: Helpers
                                                                  .txtSpeedometerStyle,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          }),
                                        );
                                      }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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

                  //BAR_LEFT AND BAR_RIGTH
                  if (kIsWeb) ...[
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: MenuLeft(
                        width: 75,
                        itemsMenu: [
                          BtnMenuLeft(Helpers.racesSVG, status: true),
                          BtnMenuLeft(Helpers.phoneSVG),
                          BtnMenuLeft(Helpers.compassSVG),
                          BtnMenuLeft(Helpers.musicalNoteSVG),
                        ],
                      ),
                    ),

                    //BAR_RIGHT
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: MenuRight(
                        speed: _speed,
                        max: kms.reduce(math.max),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            //FOOTER
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.5),
                  spreadRadius: 0,
                  blurRadius: 50,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ]),
              child: Footer(speed: _speed),
            ),
          ],
        ),
      ),
    );
  }
}

class Car extends StatelessWidget {
  const Car({Key? key, required this.width}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Positioned(
        bottom: 0,
        child: Image.asset(
          Helpers.car1Img,
          width: width,
        ),
      );
    else
      return LayoutBuilder(
        builder: (_, constraints) {
          final height = constraints.maxHeight;
          return Transform.translate(
            offset: Offset(0.0, height / 3),
            child: Image.asset(
              Helpers.car1Img,
              width: height / 2.5,
            ),
          );
        },
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
        Colors.grey.shade300,
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
