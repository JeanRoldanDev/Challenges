// import 'package:challenges/page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//       // home: TweenAnimationBuilderDemo(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   double radianToDegree(double radian) {
//     return radian * 180 / math.pi;
//   }

//   // List<Widget> hola() {
//   //   final da = List<Widget>.from([]);
//   //   for (var i = 0; i < 360; i++) {
//   //     print(i);
//   //   }
//   // }

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     // _controller.stop();

//     // if (false) {
//     // _controller.repeat();
//     // }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // _controller.stop();

//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: Container(
//         width: 500,
//         height: 500,
//         color: Colors.yellow,
//         child: Stack(
//           children: [
//             CupertinoActivityIndicator(),

//             Container(
//               height: 400,
//               width: 400,
//               color: Colors.blue.shade200,
//               child: CustomPaint(
//                 painter: _CupertinoActivityIndicatorPainter(
//                   activeColor: Colors.red,
//                   radius: 100,
//                   progress: 1.0,
//                 ),
//               ),
//             ),

//             // Positioned(
//             //   left: 150,
//             //   child: Transform.rotate(
//             //     angle: 0 * math.pi / 180,
//             //     alignment: Alignment.bottomCenter,
//             //     child: Container(
//             //       width: 3,
//             //       height: 150,
//             //       color: Colors.red,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // const List<int> kms = <int>[
// //   0,
// //   50,
// //   100,
// //   150,
// //   200,
// //   250,
// //   300,
// //   350,
// //   400,
// // ];

// const List<int> kms = <int>[
//   0,
//   10,
//   20,
//   30,
//   40,
//   50,
//   60,
//   70,
//   80,
//   90,
//   100,
// ];

// class _CupertinoActivityIndicatorPainter extends CustomPainter {
//   _CupertinoActivityIndicatorPainter({
//     required this.activeColor,
//     required this.radius,
//     required this.progress,
//   }) : super();

//   final Color activeColor;
//   final double radius;
//   final double progress;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint();
//     final int tickCount = kms.length;
//     final int tickCountTotal = kms.length * 10;

//     // print(size.width);
//     canvas.save();
//     canvas.translate(size.width / 2.0, size.height / 2.0);

//     canvas.rotate(-((110 * math.pi) / 180));
//     final degreesTotal = (220 * math.pi) / 180;
//     final ra = size.width / 2;
//     // final RRect line = RRect.fromLTRBXY(0, ra - 40, 5, ra, 10, 10);

//     final RRect line = RRect.fromLTRBXY(0, -ra, 3, 0, 0, 0);
//     for (int i = 0; i < tickCountTotal; ++i) {
//       paint.color = i == 0 ? Colors.black : Colors.red;
//       canvas.drawRRect(line, paint);
//       if (i > 0) {}
//       canvas.rotate(degreesTotal / tickCountTotal);
//       // final angle = 2 * math.pi / tickCount;
//       // canvas.rotate(-angle * i);
//       // canvas.rotate((math.pi * 2.0) / tickCount);
//     }

//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(_CupertinoActivityIndicatorPainter oldPainter) {
//     return oldPainter.activeColor != activeColor ||
//         oldPainter.progress != progress;
//   }
// }
