import 'package:challenges/challenge_bank_diego/pages/bank_page.dart';
import 'package:challenges/challenge_flutter_ecuador_one/speedometer_card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SpeedometerCardPage(),
    );
  }
}
