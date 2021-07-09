import 'package:flutter/cupertino.dart';
// https://gist.github.com/mlocati/7210513
import 'dart:math' as math;

class Helpers {
  static Color _blue = Color(0xff0997f2);
  static Color get blueColor => _blue;

  static TextStyle get txtSpeedometerStyle =>
      TextStyle(fontWeight: FontWeight.w400, color: _blue);
}

extension FancyIterable on Iterable<int> {
  int get max => reduce(math.max);

  int get min => reduce(math.min);
}
