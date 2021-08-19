import 'dart:ui';
import 'package:challenges/car_selling/pages/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  ValueNotifier<double> slideAuto = ValueNotifier<double>(15.0);
  @override
  Widget build(BuildContext context) {
    final heightAuto = 200.00;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: Stack(
                children: [
                  //LOGO
                  Align(
                    alignment: Alignment.topRight,
                    child: Opacity(
                      opacity: 0.40,
                      child: Container(
                        width: 200,
                        height: heightAuto - 50,
                        child: SvgPicture.asset(
                          'assets/images/4_car_selling/icons/3.svg',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          color: CColors.black,
                        ),
                      ),
                    ),
                  ),
                  // BASE
                  Positioned(
                    top: heightAuto * 0.40 + 50,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomPaint(
                        painter: ShapePainter(colorFlat: Colors.white),
                        child: SizedBox(
                          height: heightAuto / 2,
                        ),
                      ),
                    ),
                  ),
                  //SHADO LEFT
                  Container(
                    alignment: Alignment.bottomRight,
                    // height: heightAuto + 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.10),
                          Colors.white.withOpacity(0.25),
                          Colors.white.withOpacity(0.90),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        tileMode: TileMode.clamp,
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.90),
                          Colors.white.withOpacity(0.25),
                          Colors.white.withOpacity(0.10),
                        ],
                      ),
                    ),
                  ),
                  // AUTO 3D
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: heightAuto,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ValueListenableBuilder(
                        valueListenable: slideAuto,
                        builder: (_, double value, __) {
                          return RepaintBoundary(
                            child: IndexedStack(
                              alignment: Alignment.center,
                              index: value.toInt(),
                              children: [
                                for (var i = 1; i <= 50; i++)
                                  Image.asset(
                                    'assets/images/4_car_selling/$i.png',
                                    gaplessPlayback: true,
                                    alignment: Alignment.center,
                                  )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Slider
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: heightAuto,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ValueListenableBuilder<double>(
                        valueListenable: slideAuto,
                        builder: (_, value, __) {
                          return SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.transparent,
                              inactiveTrackColor: Colors.transparent,
                              thumbColor: Colors.transparent,
                              thumbShape: SliderComponentShape.noOverlay,
                              overlayColor: Colors.transparent,
                              overlayShape: SliderComponentShape.noOverlay,
                            ),
                            child: Slider(
                              min: 1,
                              max: 49,
                              onChanged: (double value) {
                                slideAuto.value = value;
                                print(value.toInt());
                              },
                              value: slideAuto.value,
                            ),
                          );

                          // Slider(
                          //   min: 1,
                          //   max: 100,
                          //   activeColor: Colors.transparent,
                          //   inactiveColor: Colors.transparent,
                          //   value: slideAuto.value,
                          //   onChanged: (value) {
                          //     slideAuto.value = value;
                          //   },
                          // );
                        },
                      ),
                    ),
                  ),

                  Positioned(
                    top: heightAuto + 50,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: heightAuto,
                      padding: EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        gradient: LinearGradient(
                          tileMode: TileMode.clamp,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            CColors.purple.withOpacity(0.05),
                            CColors.purple.withOpacity(0.99),
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PreviewItem(
                            skewY: 0.2,
                            rotateY: 30,
                            nameImg: 'assets/images/4_car_selling/15.png',
                            height: 130,
                          ),
                          PreviewItem(
                            nameImg: 'assets/images/4_car_selling/1.png',
                            height: 130,
                            translateY: 10,
                          ),
                          PreviewItem(
                            skewY: -0.2,
                            rotateY: -30,
                            nameImg: 'assets/images/4_car_selling/2.png',
                            height: 130,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewItem extends StatelessWidget {
  final double skewY;
  final double rotateY;
  final String nameImg;
  final double height;
  final double translateY;
  const PreviewItem({
    this.skewY = 0,
    this.rotateY = 0,
    this.translateY = 0,
    required this.nameImg,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.skewY(skewY)
          ..rotateY(vector.radians(rotateY))
          ..translate(0.00, translateY),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: Colors.white,
            height: height,
            child: Image.asset(
              nameImg,
              gaplessPlayback: true,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Path path_0 = Path();
    // path_0.moveTo(size.width * 0.5864286, size.height * 0.5381145);
    // path_0.lineTo(size.width * 0.5864286, size.height * 0.6192929);
    // path_0.cubicTo(size.width * 0.5860476, size.height * 0.6309428, size.width * 0.5956667, size.height * 0.6352525, size.width * 0.6072381,
    //     size.height * 0.6334343);
    // path_0.cubicTo(size.width * 0.6870952, size.height * 0.6150505, size.width * 0.7273333, size.height * 0.6058586, size.width * 0.7273333,
    //     size.height * 0.6058586);
    // path_0.cubicTo(size.width * 0.7420952, size.height * 0.6023232, size.width * 0.7484286, size.height * 0.5991919, size.width * 0.7484286,
    //     size.height * 0.5917172);
    // path_0.lineTo(size.width * 0.7484286, size.height * 0.5105387);
    // path_0.cubicTo(size.width * 0.7487143, size.height * 0.4992256, size.width * 0.7381905, size.height * 0.4940741, size.width * 0.7273333,
    //     size.height * 0.4963973);
    // path_0.lineTo(size.width * 0.6068571, size.height * 0.5241077);
    // path_0.cubicTo(size.width * 0.5973333, size.height * 0.5264310, size.width * 0.5863810, size.height * 0.5304040, size.width * 0.5864286,
    //     size.height * 0.5381145);
    // path_0.close();

    // Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xffFFF212).withOpacity(1.0);
    // canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(0, size.height * 0.1);
    // path_1.cubicTo(
    //   10,
    //   10,
    //   20,
    //   20,
    //   10,
    //   10,
    // );
    path_1.lineTo(0, size.height * 0.80);
    path_1.lineTo(size.height / 2, size.width / 2);

    // path_1.cubicTo(size.width * 0.2571905, size.height * 0.6154882, size.width * 0.2169524, size.height * 0.6062963, size.width * 0.2169524,
    //     size.height * 0.6062963);
    // path_1.cubicTo(size.width * 0.2021905, size.height * 0.6027609, size.width * 0.1958571, size.height * 0.5996296, size.width * 0.1958571,
    //     size.height * 0.5921549);
    // path_1.lineTo(size.width * 0.1958571, size.height * 0.5109764);
    // path_1.cubicTo(size.width * 0.1955714, size.height * 0.4996633, size.width * 0.2060952, size.height * 0.4945118, size.width * 0.2169524,
    //     size.height * 0.4968350);
    // path_1.lineTo(size.width * 0.3374286, size.height * 0.5245455);
    // path_1.cubicTo(size.width * 0.3469524, size.height * 0.5268687, size.width * 0.3579048, size.height * 0.5308418, size.width * 0.3578571,
    //     size.height * 0.5385522);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.red;
    canvas.drawPath(path_1, paint_1_fill);

    // Path path_2 = Path();
    // path_2.moveTo(size.width * 0.5552857, size.height * 0.6304040);
    // path_2.lineTo(size.width * 0.5552857, size.height * 0.5460943);
    // path_2.cubicTo(size.width * 0.5552857, size.height * 0.5349832, size.width * 0.5424286, size.height * 0.5258923, size.width * 0.5267143,
    //     size.height * 0.5258923);
    // path_2.lineTo(size.width * 0.4188095, size.height * 0.5258923);
    // path_2.cubicTo(size.width * 0.4030952, size.height * 0.5258923, size.width * 0.3902381, size.height * 0.5349832, size.width * 0.3902381,
    //     size.height * 0.5460943);
    // path_2.lineTo(size.width * 0.3902381, size.height * 0.6304040);
    // path_2.cubicTo(size.width * 0.3902381, size.height * 0.6415152, size.width * 0.4030952, size.height * 0.6506061, size.width * 0.4188095,
    //     size.height * 0.6506061);
    // path_2.lineTo(size.width * 0.5267143, size.height * 0.6506061);
    // path_2.cubicTo(size.width * 0.5424286, size.height * 0.6506061, size.width * 0.5552857, size.height * 0.6415152, size.width * 0.5552857,
    //     size.height * 0.6304040);
    // path_2.close();

    // Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    // paint_2_fill.color = Color(0xffFFF212).withOpacity(1.0);
    // canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ShapePainter extends CustomPainter {
  final Color colorBase;
  final Color colorFlat;

  ShapePainter({
    this.colorBase = const Color(0xffCBD4E6),
    this.colorFlat = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = colorBase
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width * 0.50, size.height * 0.60),
          width: size.width,
          height: size.height,
        ),
        paint1);

    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = colorFlat
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width * 0.50, size.height * 0.50),
          width: size.width,
          height: size.height,
        ),
        paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Header extends StatelessWidget {
  final double height;
  const Header({Key? key, this.height = 60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: CColors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: CColors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(color: Colors.grey.shade300, width: 2),
            ),
            padding: const EdgeInsets.only(right: 4),
            child: Icon(CupertinoIcons.chevron_back,
                size: 35, color: CColors.lila),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Tesla ',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: CColors.lila,
                    ),
                  ),
                  Text(
                    'Model S',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: CColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Curve2 extends CustomClipper<Path> {
  static const double heightCone = 70;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, (size.height / 2));
    path.lineTo((size.width / 2) + (heightCone / 2), size.height);
    path.lineTo((size.width / 2) - (heightCone / 2), size.height);
    // path.quadraticBezierTo(size.width * 0.75, size.height, (size.width / 2) + 50, size.height);
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(size.width * 0.25, size.height, 0, size.height - 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
