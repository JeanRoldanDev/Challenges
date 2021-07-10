import 'package:challenges/helper.dart';
import 'package:flutter/material.dart';

class SpeedNumKm extends StatelessWidget {
  const SpeedNumKm({
    Key? key,
    required this.km,
  }) : super(key: key);
  final int km;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            '$km',
            style: Helpers.txtNumKmStyle,
          ),
          FittedBox(
            child: Text(
              'km/h',
              style: Helpers.txtKmhStyle,
            ),
          ),
        ],
      ),
    );
  }
}
