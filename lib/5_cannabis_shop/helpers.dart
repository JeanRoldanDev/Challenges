import 'package:flutter/material.dart';

class Helpers {
  static const _konnectFont = 'pulp_display';

  static get font => _konnectFont;

  static const Color principalColor = Color(0xff1C2740);
  static const Color backgroud = Color(0xffDFE1E4);
  static const Color grey = Color(0xffC2C3C4);

  static const TextStyle txtTitlemodal = TextStyle(
    fontFamily: _konnectFont,
    fontWeight: FontWeight.bold,
    color: principalColor,
    fontSize: 30,
  );
  static const TextStyle txtSubTitlemodal = TextStyle(
    fontFamily: _konnectFont,
    fontWeight: FontWeight.w100,
    color: principalColor,
    fontSize: 18,
  );

  static const TextStyle txtPrice = TextStyle(
    fontFamily: _konnectFont,
    color: principalColor,
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle txtBtnTabsNotifications = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
}
