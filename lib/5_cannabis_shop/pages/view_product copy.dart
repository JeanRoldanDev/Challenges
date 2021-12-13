// import 'dart:ui';

// import 'package:challenges/car_selling/pages/constants.dart';
// import 'package:flutter/material.dart';

// class ViewProduct extends StatelessWidget {
//   const ViewProduct({Key? key}) : super(key: key);
// // BackdropFilter
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//         canvasColor: Colors.transparent,
//         backgroundColor: Colors.transparent,
//       ),
//       child: Scaffold(
//         body: Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             color: Colors.transparent,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     'assets/images/4_car_selling/aaa.png',
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 Expanded(
//                   child: CustomPaint(
//                     painter: FondoPainter(),
//                     child: Container(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.90,
//                       child: Text('holis'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// //https://yqnn.github.io/svg-path-editor/
// //https://fluttershapemaker.com/
// class FondoPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.save();
//     Paint paint = new Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 2;

//     Path path_0 = Path();
//     path_0.moveTo(size.width, size.height);
//     path_0.lineTo(size.width, size.height * 0.38);
//     path_0.lineTo(size.width * 0.861, size.height * 0.13);
//     path_0.quadraticBezierTo(
//       size.width * 0.84,
//       size.height * 0.10,
//       size.width * 0.78,
//       size.height * 0.103,
//     );
//     path_0.lineTo(size.width * 0.07, size.height * 0.197);
//     path_0.quadraticBezierTo(
//       0,
//       size.height * 0.21,
//       0,
//       size.height * 0.24,
//     );
//     path_0.lineTo(0, size.height);
//     path_0.close();

//     canvas.drawPath(path_0, paint);
//     canvas.restore();
//   }

//   @override
//   bool shouldRepaint(FondoPainter oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(FondoPainter oldDelegate) => false;
// }
