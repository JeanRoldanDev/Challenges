import 'dart:ui' as ui;

import 'package:challenges/constanst.dart';
import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:challenges/streaming/widgets/paths/path_header_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderStreaming extends StatelessWidget {
  const HeaderStreaming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.heightHeader,
      child: ClipPath(
        clipper: PathHeaderClipper(borderRadius: 40),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CColors.purpleLigth.withOpacity(.5),
                CColors.purple.withOpacity(.5),
              ],
              stops: const [0.01, 0.40],
            ),
          ),
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 5,
              sigmaY: -5,
              tileMode: TileMode.repeated,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _Huser(),
                SizedBox(width: 5),
                _Htitle(),
                _Hchat(),
                SizedBox(width: 10),
                _Hpoints(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Hpoints extends StatelessWidget {
  const _Hpoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CColors.purpleLigth.withOpacity(0.50),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('200', style: TextStyles.txtDefault),
    );
  }
}

class _Hchat extends StatelessWidget {
  const _Hchat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Vectors.chat,
      width: 30,
      color: Colors.white,
    );
  }
}

class _Htitle extends StatelessWidget {
  const _Htitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'M4st3rmiau',
            style: TextStyles.txtHeader,
          ),
          Text(
            'Online',
            style: TextStyles.txtHeaderSubtitle,
          ),
        ],
      ),
    );
  }
}

class _Huser extends StatelessWidget {
  const _Huser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            left: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CColors.purple,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(UserGlobal.list[0].img),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 0,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
