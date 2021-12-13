import 'dart:ui';

import 'package:challenges/5_cannabis_shop/pages/view_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//
class CannabisShop extends StatelessWidget {
  const CannabisShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sigmaX = 1.5;
    return Scaffold(
      appBar: AppBar(
        title: Text('fondo'),
      ),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/5_cannabis_shop/icons/store.svg',
              alignment: Alignment.center,
            ),
            TextButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.60),
                  filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
                  builder: (context) => ViewProduct(),
                );
              },
              child: Text(
                'Jean Roldan',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
