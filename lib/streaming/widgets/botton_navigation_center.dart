import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottonNavigationCenter extends StatelessWidget {
  const BottonNavigationCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: PhysicalModel(
        color: Colors.transparent,
        shadowColor: CColors.purple,
        elevation: 7,
        shape: BoxShape.circle,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Images.center,
                fit: BoxFit.cover,
                color: CColors.purple,
              ),
              Positioned(
                top: -26,
                child: SizedBox(
                  width: 22,
                  child: SvgPicture.asset(
                    Vectors.streaming,
                    fit: BoxFit.fitWidth,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
