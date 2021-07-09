import 'package:challenges/helper.dart';
import 'package:challenges/kminfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

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
  10,
  20,
  30,
  40,
  50,
  60,
  70,
  80,
  90,
  100,
];

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              color: Colors.grey,
            ),
            //BODY
            Expanded(
              child: Row(
                children: [
                  //BAR_LEFT
                  Container(
                    width: 100,
                    color: Colors.black,
                  ),
                  //VELOCIMETRO
                  //LayoutBuilder
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
                            //LINES VELOCIMETRO
                            Container(
                              width: minWidth - (textWidth * 1.8),
                              height: minWidth - (textWidth * 1.8),
                              // decoration: BoxDecoration(
                              //   color: Colors.purple,
                              //   shape: BoxShape.circle,
                              //   border: Border.all(
                              //     width: 1,
                              //     color: Colors.black,
                              //   ),
                              // ),
                              // padding: EdgeInsets.all(30),
                              child: CustomPaint(
                                painter: _LinesSpeedometer(),
                              ),
                            ),
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
                                    // color: Colors.red,
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
                          ],
                        );
                      },
                    ),
                  ),
                  //BAR_RIGHT
                  Container(
                    width: 80,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            //FOOTHER
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              color: Colors.grey,
              child: CustomPaint(painter: KmInfo()),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinesSpeedometer extends CustomPainter {
  _LinesSpeedometer() : super();

  @override
  void paint(Canvas canvas, Size size) {
    // print(size.height);
    final Paint paint = Paint();
    //TOTAL ITEMS
    final int tickCount = kms.length - 1;
    //TOTAL ITEMS + LINES INTERNAL
    final int tickCountInternal = 8;
    //TOTAL
    final total = (tickCountInternal * tickCount) + kms.length;

    //CIRCLE RADIUS
    final radius = size.width / 2;
    //CIRCLE DEGREES TOTAL
    final degreesTotal = (220 * math.pi) / 180;
    //GRADE MOVE AGAINST CLOCK HANDS
    final gradual = ((20 * math.pi) / 180);

    canvas.save();
    canvas.translate(radius, radius);

    //GRADE MOVE AGAINST CLOCK HANDS
    canvas.rotate(-((90 * math.pi) / 180) - gradual);

    for (int i = 0; i <= tickCount; ++i) {
      paint.color = Colors.black;
      final RRect line =
          RRect.fromLTRBXY(0, -(radius - 0), 3, -(radius - 20), 5, 5);
      canvas.drawRRect(line, paint);
      canvas.rotate(degreesTotal / total);
      if (i < tickCount) {
        for (var eje = 1; eje <= tickCountInternal; eje++) {
          paint.color = Colors.grey;
          final RRect line =
              RRect.fromLTRBXY(0, -(radius - 7), 1, -(radius - 20), 5, 5);
          canvas.drawRRect(line, paint);
          canvas.rotate(degreesTotal / total);
        }
      }
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_LinesSpeedometer oldPainter) => true;
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

class Speedometer extends StatelessWidget {
  const Speedometer({
    Key? key,
    required this.wborder,
    required this.items,
    required this.step,
    required this.gradual,
  }) : super(key: key);

  final double wborder;
  final int items;
  final double step;
  final double gradual;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Container(
        //   height: 500,
        //   width: 500,
        //   color: Colors.yellow,
        //   child: CustomPaint(
        //     painter: _CupertinoActivityIndicatorPainter(
        //       activeColor: Colors.red,
        //       radius: 100,
        //       progress: 1.0,
        //     ),
        //   ),
        // ),
        Container(
          color: Colors.red,
          width: wborder,
          height: wborder,
          padding: EdgeInsets.all(30),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                ),
                child: Container(
                  width: wborder - 30,
                  height: wborder - 30,
                  child: CustomPaint(
                    painter: _LinesSpeedometer(),
                  ),
                ),
              ),
              ...List.generate(
                items + 1,
                (index) {
                  final ww = wborder - 30;
                  return Transform.translate(
                    offset: Offset(
                      -(ww / 2 * math.cos((step * index) - gradual)),
                      -(ww / 2 * math.sin((step * index) - gradual)),
                    ),
                    child: Container(
                      width: 30,
                      height: 15,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text('${index * 100}'),
                      ),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
