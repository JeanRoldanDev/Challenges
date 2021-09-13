import 'package:challenges/streaming/helpers/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const String _font = 'Poppins';

  static const txtTitle = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: Colors.white,
  );

  static const txtTitleLigth = TextStyle(
    fontFamily: _font,
    fontSize: 20,
    color: CColors.purpleLigth,
  );

  static const txtSubTitle = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
  );

  static const txtDefault = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.w200,
    fontSize: 15,
    color: Colors.white,
  );

  static const txtDefaultB = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.white,
  );

  static const txtTag = TextStyle(
    fontFamily: _font,
    fontWeight: FontWeight.w200,
    fontSize: 10,
    color: Colors.white,
  );
}
