import 'dart:ui' as ui;

import 'package:challenges/streaming/helpers/helpers.dart';
import 'package:challenges/streaming/widgets/paths/path_navigation_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottonNavigationStreaming extends StatelessWidget {
  BottonNavigationStreaming({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  final void Function(int index) ontap;

  final ValueNotifier<int> indexPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.09,
      child: ClipPath(
        clipper: PathNavigationClipper(
          widthCenter: MediaQuery.of(context).size.width * 0.15,
          borderRadius: 40,
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CColors.purple.withOpacity(0.85),
                CColors.purpleLigth.withOpacity(0.85),
              ],
              stops: const [0.01, 0.40],
            ),
          ),
          child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 5,
              sigmaY: -5,
              tileMode: TileMode.repeated,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ValueListenableBuilder<int>(
                valueListenable: indexPage,
                builder: (_, value, __) {
                  return Row(
                    children: [
                      _NavigationBar(
                        assetName: Vectors.home,
                        status: value == 0,
                        ontap: () {
                          indexPage.value = 0;
                          ontap(0);
                        },
                      ),
                      _NavigationBar(
                        assetName: Vectors.search,
                        status: value == 1,
                        ontap: () {
                          indexPage.value = 1;
                          ontap(1);
                        },
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                      _NavigationBar(
                        assetName: Vectors.explore,
                        status: value == 2,
                        ontap: () {
                          indexPage.value = 2;
                          ontap(2);
                        },
                      ),
                      _NavigationBar(
                        assetName: Vectors.notification,
                        status: value == 3,
                        ontap: () {
                          indexPage.value = 3;
                          ontap(3);
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({
    Key? key,
    this.status = false,
    required this.assetName,
    this.ontap,
  }) : super(key: key);
  final bool status;
  final String assetName;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: SvgPicture.asset(
          assetName,
          width: 23,
          height: 23,
          color: status ? Colors.white : CColors.purple,
        ),
      ),
    );
  }
}
