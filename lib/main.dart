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
    return const MaterialApp(
      title: 'Flutter Challenges',
      debugShowCheckedModeBanner: false,
      home: _Principal(),
    );
  }
}

const colorDefault = Color(0xff0087fc);

class _Principal extends StatelessWidget {
  const _Principal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Challenges',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Flexible(
              child: ListView(
                itemExtent: 95,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  _Item(
                    assetName: 'assets/icon_menu/1_speedometer.svg',
                    title: 'Spedometer',
                    subTitle: '''
This challenge was proposed by the Flutter Ecuador community on tables and web, 
but I decided to extend it to a real environment''',
                    ontap: () {},
                  ),
                  _Item(
                    assetName: 'assets/icon_menu/2_bank.svg',
                    title: 'Banking',
                    subTitle: '''
This challenge was proposed by the Diego Velazquez''',
                    ontap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.assetName,
    required this.ontap,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String assetName;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorDefault, width: 2),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: CupertinoButton(
        onPressed: ontap,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(
                'assets/icon_menu/1_speedometer.svg',
                color: colorDefault,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    subTitle,
                    maxLines: 2,
                    softWrap: true,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              CupertinoIcons.arrow_right_square,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}
