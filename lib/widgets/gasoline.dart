import 'package:challenges/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Gasoline extends StatelessWidget {
  const Gasoline({
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
            Helpers.stationSVG,
            width: 20,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.grey.shade400,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.grey..shade400,
          ),
          SvgPicture.asset(
            Helpers.dropFillSVG,
            width: 13,
            alignment: Alignment.center,
            color: Colors.grey..shade400,
          ),
        ],
      ),
    );
  }
}
