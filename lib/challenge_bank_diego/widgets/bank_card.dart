import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
    required this.text,
    required this.img,
    required this.radio,
  }) : super(key: key);

  final String text;
  final String img;

  final double radio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radio),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
