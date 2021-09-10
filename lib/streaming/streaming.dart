import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:challenges/streaming/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StreamingApp extends StatelessWidget {
  const StreamingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUI);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Images.bg1,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Image.asset(
              Images.tt1,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: CustomPaint(
                painter: NavigationBarPainter(
                  widthCenter: MediaQuery.of(context).size.width * 0.20,
                ),
                child: Container(
                    // color: Colors.amber.withOpacity(0.20),
                    ),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: SizedBox(
          //     height: kBottomNavigationBarHeight + 10,
          //     child: Stack(
          //       fit: StackFit.expand,
          //       children: [
          //         Positioned(
          //           left: 0,
          //           right: 0,
          //           top: 0,
          //           child: Opacity(
          //             opacity: 0.40,
          //             child: Image.asset(
          //               Images.tabbar,
          //               fit: BoxFit.fitHeight,
          //             ),
          //           ),
          //         ),
          //         Row(
          //           children: [
          //             NavigationBar(
          //               assetName: Vectors.home,
          //               status: true,
          //             ),
          //             NavigationBar(
          //               assetName: Vectors.search,
          //               status: true,
          //             ),
          //             SizedBox(width: MediaQuery.of(context).size.width * 0.18),
          //             NavigationBar(
          //               assetName: Vectors.explorer,
          //               status: true,
          //             ),
          //             NavigationBar(
          //               assetName: Vectors.notification,
          //               status: true,
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Positioned(
            bottom: 40,
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: PhysicalModel(
                color: Colors.transparent,
                shadowColor: CColors.purple,
                elevation: 10,
                shape: BoxShape.circle,
                child: Image.asset(
                  Images.center,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.15,
                  color: CColors.purple,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBarPainter extends CustomPainter {
  const NavigationBarPainter({required this.widthCenter});
  final double widthCenter;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final paint = Paint();

    paint.color = Colors.blue;

    final p1 = (size.width / 2) - (widthCenter / 2);
    final p2 = size.width / 2;
    final p3 = (size.width / 2) + (widthCenter / 2);

    final path = Path();
    // path.addArc(
    //   Rect.fromCircle(
    //     center: Offset((radius * radioMarkWidth) - (radioMark / 2), 0),
    //     radius: (radioMark / 2),
    //   ),
    //   ((90 * math.pi) / 180),
    //   -((180 * math.pi) / 180),
    // );
    path.lineTo(p1, 0);
    path.lineTo(p2, size.height / 2);
    path.lineTo(p3, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
    canvas.restore();
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
          width: 20,
          color: status ? Colors.white : CColors.grey,
        ),
      ),
    );
  }
}
