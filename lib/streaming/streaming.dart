import 'dart:ui';

import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:challenges/streaming/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StreamingApp extends StatelessWidget {
  const StreamingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUI);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              Images.bg1,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: Image.asset(
                Images.tt1,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 150,
              // right: 0,
              child: Image.asset(
                Images.img1,
                width: 100,
                height: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: -110,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.40,
                child: Image.asset(
                  Images.tabbar,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
