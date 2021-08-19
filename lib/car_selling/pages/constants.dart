import 'package:flutter/material.dart';

class CC {
  CC(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
  double width = 0;
  double height = 0;
}

class CImg {
  const CImg();
  // static const String img5 = 'assets/img/5.jpeg';
  // static const String opps = 'assets/img/icon.png';
  // static const String user = 'assets/img/user.jpeg';
}

class CColors {
  const CColors();
  // static const Color greenL = Color(0xFFE1F4EE);
  // static const Color greenB = Color(0xFFA7B4A4);
  // static const Color greyL = Color(0xFF787878);
  // static const Color greyB = Color(0xFF4E4E4E);
  static const Color black = Colors.black54;
  static const Color white = Color(0XFFF7F7F7);
  static const Color lila = Color(0xFF2C437E);
  static const Color purple = Color(0xffCBD4E6);
  static const Color background = Color(0xFFDBEEFE);
}

class CFonts {
  const CFonts();
  // static const String poppins = 'poppins';
}
