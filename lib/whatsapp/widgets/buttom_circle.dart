import 'package:challenges/whatsapp/helpers.dart';
import 'package:flutter/material.dart';

class ButtomCircle extends StatelessWidget {
  const ButtomCircle({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Helpers.greyLigthColor,
    this.size = 35,
    this.iconSize = 25,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final IconData icon;
  final Color backgroundColor;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      margin: const EdgeInsets.only(right: 10),
      child: IconButton(
        onPressed: onPressed,
        color: Helpers.principalColor,
        splashRadius: 19,
        splashColor: Colors.grey,
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
