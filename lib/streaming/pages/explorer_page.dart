import 'dart:async';
import 'dart:ui' as ui;

import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: Constants.heightHeader),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: CColors.purple,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  const Expanded(
                    child: Text(
                      'Explorar',
                      style: TextStyles.txtTitle,
                    ),
                  ),
                  const Text(
                    'Top Games',
                    style: TextStyles.txtTitleWrite,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                itemCount: Constants.gamesExplorer.length,
                itemExtent: MediaQuery.of(context).size.width / 2.2,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return _ItemList(
                    gameExplorer: Constants.gamesExplorer[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList({
    Key? key,
    required this.gameExplorer,
  }) : super(key: key);
  final GameExplorer gameExplorer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraint) {
        final w = boxConstraint.maxWidth;
        final h = boxConstraint.maxHeight;
        return Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: h * 0.90,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipPath(
                  clipper: const PathItemSliderClipper(borderRadius: 20),
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: -5,
                    ),
                    child: Container(
                      color: CColors.purple.withOpacity(0.25),
                      child: Opacity(
                        opacity: 0.20,
                        child: Image.asset(
                          Images.efect,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                width: w * 0.75,
                child: Image.asset(
                  gameExplorer.img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gameExplorer.name,
                    style: TextStyles.txtHeader,
                  ),
                  Text(
                    gameExplorer.views,
                    style: TextStyles.txtDefaultL,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class PathItemSliderClipper extends CustomClipper<Path> {
  const PathItemSliderClipper({
    required this.borderRadius,
  });

  final double borderRadius;
  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;
    final path = Path()
      ..moveTo(w, h - borderRadius)
      ..lineTo(w, borderRadius)
      ..quadraticBezierTo(w, 0, w - borderRadius, 0)
      ..lineTo((w * 0.10) + (borderRadius / 2), h * 0.10)
      ..quadraticBezierTo(0, h * 0.10, 0, h * 0.20 + (borderRadius / 2))
      ..lineTo(0, h - borderRadius)
      ..quadraticBezierTo(0, h, borderRadius, h)
      ..lineTo(w - borderRadius, h)
      ..quadraticBezierTo(w, h, w, h - borderRadius)
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
