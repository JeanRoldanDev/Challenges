import 'package:challenges/Streaming/streaming.dart';
import 'package:challenges/menu/menu_principal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Challenges',
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
