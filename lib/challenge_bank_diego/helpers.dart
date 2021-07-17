import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Helpers {
  static const _konnectFont = 'Konnect';

  static String get fontPrincipal => _konnectFont;

  static const Color purpleLigth_color = Color(0xffdddffe);
  static Color purpleColor = Colors.purple.shade900;

  static TextStyle txtNameUser = TextStyle(
    color: purpleColor,
    fontWeight: FontWeight.normal,
    fontFamily: _konnectFont,
    fontSize: 25,
  );

  static TextStyle txtName = TextStyle(
    color: purpleColor,
    fontWeight: FontWeight.normal,
    fontFamily: _konnectFont,
  );

  static TextStyle txtHoliday = TextStyle(
    color: purpleColor.withOpacity(0.50),
    fontWeight: FontWeight.bold,
    fontFamily: _konnectFont,
  );

  static TextStyle txtList = TextStyle(
    color: purpleColor,
    fontWeight: FontWeight.normal,
    fontFamily: _konnectFont,
    fontSize: 15,
  );
}
