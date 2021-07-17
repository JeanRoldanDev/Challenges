import 'package:flutter/material.dart';

class Helpers {
  static const _konnectFont = 'Konnect';

  static const Color greyLigth_color = Color(0xffDEDEDE);
  static const Color principal_color = Color(0xff36446A);
  static const Color green_color = Color(0xff5EBC7B);

  static const TextStyle txtHistory_style = TextStyle(
    fontFamily: _konnectFont,
    fontSize: 9,
  );

  static const TextStyle txtBtnTabsNotifications = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );

  static TextStyle txtBtnTabs(bool status) => TextStyle(
        fontFamily: _konnectFont,
        fontSize: 12,
        color: status ? Colors.white : principal_color,
      );
}
