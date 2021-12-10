import 'package:flutter/material.dart';

class TextStyles {
  static const Color _blue = Color(0xff0997f2);

  static const txtSpeedometerStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: _blue,
  );

  static const txtNumKmStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
    color: _blue,
  );

  static const txtKmhStyle = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w300,
  );

  static const txtDistanceKMStyle = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const txtmini = TextStyle(
    color: Colors.blue,
    fontSize: 7,
  );

  static const txtHour = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const txtHourType = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );

  static const txtDegreeCentigrade = TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.w300,
    fontSize: 10,
  );

  static const txtNameProfile = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );
}
