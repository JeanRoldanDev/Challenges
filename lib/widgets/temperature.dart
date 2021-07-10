import 'package:challenges/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Helpers.oilIndicatorSVG,
            width: 20,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          Text(
            '70°C',
            style: Helpers.txtDegreeCentigrade,
          ),
          Container(
            width: 70,
            height: 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade400,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Text(
            '100°C',
            style: Helpers.txtDegreeCentigrade,
          ),
        ],
      ),
    );
  }
}
