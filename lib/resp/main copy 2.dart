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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final wborder = 400.0;
    final items = 10;
    final step = ((220 * math.pi) / 180) / items;
    final gradual = ((20 * math.pi) / 180);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: kToolbarHeight,
              color: Colors.grey,
            ),
            Expanded(
              child: Stack(
                children: [
                  // Menu(),
                  Speedometer(
                    wborder: wborder,
                    items: items,
                    step: step,
                    gradual: gradual,
                  ),
                ],
              ),
            ),
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
          color: Colors.blueGrey,
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
                    painter: _CupertinoActivityIndicatorPainter(
                      activeColor: Colors.red,
                      radius: 100,
                      progress: 1.0,
                    ),
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

// const List<int> kms = <int>[
//   0,
//   50,
//   100,
//   150,
//   200,
//   250,
//   300,
//   350,
//   400,
// ];

const List<int> kms = <int>[
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

class _CupertinoActivityIndicatorPainter extends CustomPainter {
  _CupertinoActivityIndicatorPainter({
    required this.activeColor,
    required this.radius,
    required this.progress,
  }) : super();

  final Color activeColor;
  final double radius;
  final double progress;
  ui.Paragraph txtkm(String value) {
    final paragraphStyle = ui.ParagraphStyle();
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(
        ui.TextStyle(
          decorationColor: Colors.black,
          color: Colors.red,
        ),
      )
      ..addText(value);
    final constraints = ui.ParagraphConstraints(width: 300);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    return paragraph;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final int tickCount = kms.length;
    final int tickCountTotal = tickCount * 10;
    final ra = size.width / 2;
    canvas.save();
    canvas.translate(size.width / 2.0, size.height / 2.0);

    // for (int i = 0; i < tickCount; ++i) {
    //   final cal = 220 / tickCount;
    //   canvas.drawParagraph(
    //     txtkm(kms[i].toString()),
    //     Offset(
    //       -ra * math.cos((i * 12.5) * math.pi / 100),
    //       -ra * math.sin((i * 12.5) * math.pi / 100),
    //     ),
    //   );
    // }

    canvas.rotate(-((110 * math.pi) / 180));
    final degreesTotal = (220 * math.pi) / 180;

    for (int i = 0; i < tickCountTotal; ++i) {
      var hline = 0;
      final ss = kms.firstWhere((a) => a == i, orElse: () => -1);
      if (ss == i) {
        paint.color = Colors.black;
      } else {
        paint.color = Colors.red;
        hline = 5;
      }

      final RRect line =
          RRect.fromLTRBXY(0, -(ra - hline), 2, -(ra - 25), 5, 5);
      canvas.drawRRect(line, paint);
      canvas.rotate(degreesTotal / tickCountTotal);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_CupertinoActivityIndicatorPainter oldPainter) {
    return oldPainter.activeColor != activeColor ||
        oldPainter.progress != progress;
  }
}
