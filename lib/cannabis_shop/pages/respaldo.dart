

// class FondoPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.save();

//     Paint paint = new Paint()
//       ..color = Colors.red
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     Path path_0 = Path();
//     path_0.moveTo(size.width, size.height);
//     path_0.lineTo(size.width, size.height * 0.38);
//     path_0.lineTo(size.width * 0.861, size.height * 0.13);
//     path_0.quadraticBezierTo(
//       size.width * 0.851,
//       size.height * 0.10,
//       size.width * 0.79,
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
//   }

//   @override
//   bool shouldRepaint(FondoPainter oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(FondoPainter oldDelegate) => false;
// }
