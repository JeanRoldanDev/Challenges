import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class Helpers {
  static String _path = 'assets/images/1_reto_dash_speedometer';

  //=================================COLORS=================================
  static const Color _blue = Color(0xff0997f2);
  static Color get blueColor => _blue;

  //=================================STYLES=================================
  static TextStyle get txtSpeedometerStyle => const TextStyle(
        fontWeight: FontWeight.w400,
        color: _blue,
      );

  static TextStyle get txtNumKmStyle => GoogleFonts.montserrat(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 35,
      );

  static TextStyle get txtKmhStyle => const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get txtDegreeCentigrade => const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w300,
        fontSize: 10,
      );
  //=================================IMAGES=================================
  static String get car1Img => '$_path/car1.png';
  static String get car2Img => '$_path/car2.png';
  static String get bmwLogoImg => '$_path/car_icon.png';
  //=================================VECTORS================================
  static String get compassSVG => '$_path/compass.svg';
  static String get dropSVG => '$_path/drop.svg';
  static String get dropFillSVG => '$_path/dropfill.svg';
  static String get flagSVG => '$_path/flag.svg';
  static String get musicalNoteSVG => '$_path/musical_note.svg';
  static String get oilIndicatorSVG => '$_path/oil_indicator.svg';
  static String get phoneSVG => '$_path/phone.svg';
  static String get pinSVG => '$_path/pin.svg';
  static String get racesSVG => '$_path/races.svg';
  static String get stationSVG => '$_path/station.svg';
}

extension FancyIterable on Iterable<int> {
  int get max => reduce(math.max);
  int get min => reduce(math.min);
}
