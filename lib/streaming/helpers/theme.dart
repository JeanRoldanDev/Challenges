import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle get systemUI => SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.red,
      systemNavigationBarIconBrightness: Brightness.light,
    );
