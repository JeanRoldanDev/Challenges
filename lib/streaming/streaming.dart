import 'dart:ui' as ui;

import 'package:challenges/streaming/helpers/colors.dart';
import 'package:challenges/streaming/helpers/images.dart';
import 'package:challenges/streaming/helpers/theme.dart';
import 'package:challenges/streaming/pages/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StreamingApp extends StatelessWidget {
  StreamingApp({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUI);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.bg1),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              itemCount: 2,
              controller: pageController,
              itemBuilder: (_, indexPage) {
                switch (indexPage) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const ExplorePage();
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                child: ClipPath(
                  clipper: PathHeaderClipper(borderRadius: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CColors.purpleLigth.withOpacity(0.85),
                          CColors.purple.withOpacity(0.85),
                        ],
                        stops: const [0.01, 0.40],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: -5,
                        tileMode: TileMode.repeated,
                      ),
                      child: Row(
                        children: [
                          Text('adads'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
                child: ClipPath(
                  clipper: PathNavigationClipper(
                    widthCenter: MediaQuery.of(context).size.width * 0.15,
                    borderRadius: 40,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CColors.purple.withOpacity(0.85),
                          CColors.purpleLigth.withOpacity(0.85),
                        ],
                        stops: const [0.01, 0.40],
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: -5,
                        tileMode: TileMode.repeated,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            NavigationBar(
                              assetName: Vectors.home,
                              status: true,
                            ),
                            NavigationBar(
                              assetName: Vectors.search,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.15),
                            NavigationBar(
                              assetName: Vectors.explore,
                            ),
                            NavigationBar(
                              assetName: Vectors.notification,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.07,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: PhysicalModel(
                  color: Colors.transparent,
                  shadowColor: CColors.purple,
                  elevation: 7,
                  shape: BoxShape.circle,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          Images.center,
                          fit: BoxFit.cover,
                          color: CColors.purple,
                        ),
                        Positioned(
                          top: -26,
                          child: SizedBox(
                            width: 22,
                            child: SvgPicture.asset(
                              Vectors.streaming,
                              fit: BoxFit.fitWidth,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text('Descubrir'),
          ],
        ),
      ),
    );
  }
}

class PathHeaderClipper extends CustomClipper<Path> {
  PathHeaderClipper({
    required this.borderRadius,
  });

  final double borderRadius;

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;

    final path = Path()
      ..lineTo(w, 0)
      ..lineTo(w, h - borderRadius)
      ..quadraticBezierTo(w, h, w - borderRadius, h)
      ..lineTo(borderRadius, h)
      ..quadraticBezierTo(0, h, 0, h - borderRadius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ItemPainter extends CustomPainter {
  ItemPainter({
    required this.borderRadius,
    required this.width,
  });

  final double borderRadius;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    canvas.save();
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    final path = Path()
      ..moveTo(width, borderRadius)
      ..quadraticBezierTo(width, 0, width + borderRadius, 0)
      ..lineTo(w - borderRadius, 0)
      ..quadraticBezierTo(w, 0, w, borderRadius)
      ..lineTo(w, h - borderRadius)
      ..quadraticBezierTo(w, h, w - borderRadius, h)
      ..lineTo(borderRadius, h)
      ..quadraticBezierTo(0, h, 0, h - borderRadius)
      ..quadraticBezierTo(
        0,
        h - borderRadius - (borderRadius / 2),
        borderRadius / 2,
        h - borderRadius - (borderRadius / 2),
      )
      ..lineTo(
          width - (borderRadius * 1.5), h - borderRadius - (borderRadius / 2))
      ..quadraticBezierTo(
        width,
        h - borderRadius - (borderRadius / 2),
        width,
        h - (borderRadius * 2.5) - (borderRadius / 2),
      )
      ..close();
    canvas
      ..drawPath(path, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(ItemPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(ItemPainter oldDelegate) => false;
}

class PathNavigationClipper extends CustomClipper<Path> {
  const PathNavigationClipper({
    required this.widthCenter,
    required this.borderRadius,
  });
  final double widthCenter;
  final double borderRadius;
  @override
  Path getClip(Size size) {
    final p1 = (size.width / 2) - (widthCenter / 2) - 13;
    final p2 = size.width / 2;
    final p3 = (size.width / 2) + (widthCenter / 2) + 13;

    final path = Path()
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..lineTo(p1, 0)
      ..lineTo(p2, widthCenter * 0.50)
      ..lineTo(p3, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, borderRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@Deprecated('Does not match the shape of the path')
class NavigationBarPainter extends CustomPainter {
  const NavigationBarPainter({
    required this.widthCenter,
    required this.borderRadius,
  });
  final double widthCenter;
  final double borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * -0.70),
        Offset(size.width * 0.50, size.height * 0.30),
        [
          const Color(0xffffffff).withOpacity(0.9),
          const Color(0xff171741).withOpacity(0.9),
        ],
        [0, 1],
      );
    // ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 3);

    final p1 = (size.width / 2) - (widthCenter / 2) - 13;
    final p2 = size.width / 2;
    final p3 = (size.width / 2) + (widthCenter / 2) + 13;

    final path = Path()
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)
      ..lineTo(p1, 0)
      ..lineTo(p2, widthCenter * 0.50)
      ..lineTo(p3, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..quadraticBezierTo(size.width, 0, size.width, borderRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas
      ..drawPath(path, paint)
      ..restore();
  }

  @override
  bool shouldRepaint(NavigationBarPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(NavigationBarPainter oldDelegate) => false;
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    this.status = false,
    required this.assetName,
    this.ontap,
  }) : super(key: key);
  final bool status;
  final String assetName;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: SvgPicture.asset(
          assetName,
          width: 23,
          height: 23,
          color: status ? Colors.white : CColors.purple,
        ),
      ),
    );
  }
}
