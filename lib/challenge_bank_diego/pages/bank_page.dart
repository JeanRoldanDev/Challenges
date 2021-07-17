import 'dart:ui';

import 'package:challenges/challenge_bank_diego/pages/new_card_page.dart';
import 'package:challenges/widgets/listenable/value_listenable_two.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BankAnimationPage extends StatefulWidget {
  const BankAnimationPage({Key? key}) : super(key: key);
  @override
  _BankAnimationPageState createState() => _BankAnimationPageState();
}

const _heigthSocial = 150.0;
const _heigthLastConsume = 100.0;

class _BankAnimationPageState extends State<BankAnimationPage>
    with SingleTickerProviderStateMixin {
  //CONTROL ANIMATION THE SLIDER PAGE
  late AnimationController _animationController;

  //CONTROL PAGE CARD
  late PageController _pageController = PageController(
    viewportFraction: 0.90,
    initialPage: 1,
  );

  late bool _isTogglePage;

  ValueNotifier<double> transition = ValueNotifier<double>(1);
  ValueNotifier<double> transitionSlider = ValueNotifier<double>(1);
  ValueNotifier<double> currentPage = ValueNotifier<double>(_heigthSocial);

  @override
  void initState() {
    _isTogglePage = false;

    _pageController.addListener(_statusPage);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  _statusPage() {
    if (_pageController.page! <= 1) {
      transition.value = _pageController.page!.clamp(0, 1);
      transitionSlider.value = 1;
    } else {
      transitionSlider.value = _pageController.page!.clamp(1, 2);
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRaius = 30.0;
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    final maxHeightListBack =
        (maxHeight) - (_heigthSocial + _heigthLastConsume);

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final value = lerpDouble(0, maxHeight, _animationController.value)!
                .clamp(_heigthSocial, maxHeight)
                .toDouble();

            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  child: NewCardPage(
                    value: _animationController.value,
                    maxheight: value,
                    maxWidth: maxWidth,
                  ),
                ),
                Positioned(
                  top: value,
                  child: Container(
                    height: maxHeightListBack,
                    width: maxWidth,
                    child: Stack(
                      children: [
                        // FONDO
                        ValueListenableBuilderTwo<double, double>(
                          valueListenablefirst: transition,
                          valueListenableSecond: transitionSlider,
                          builder: (_, value, valueB, __) {
                            return LayoutBuilder(builder: (_, constraints) {
                              final spaceFraction = 10.0;

                              final fraction =
                                  ((maxWidth - (maxWidth * 0.90)) / 2) +
                                      (spaceFraction);
                              final spacing = (borderRaius / 2);

                              //CALCULATE MIN WIDTH AND HEIGHT THE PAGE
                              final widthPage =
                                  constraints.maxWidth - (fraction * 2);
                              final heightPage =
                                  constraints.maxHeight - borderRaius;

                              //CALCULATE MAX WIDTH AND HEIGHT THE PAGE
                              final fillHeight = maxHeight - heightPage;
                              final fillHeightPercent =
                                  fillHeight - (value * fillHeight);
                              final fillHeightTOTAL =
                                  heightPage + fillHeightPercent;

                              final spaceFractionHeightTOTAL =
                                  (borderRaius) - (value * (borderRaius));

                              //CALCULATE MAX WIDTH AND HEIGHT THE PAGE
                              final fillWidth = maxWidth - widthPage;
                              final fillWidthPercent =
                                  fillWidth - (value * fillWidth);
                              final fillWidthTOTAL =
                                  widthPage + fillWidthPercent;

                              final spaceFractionWidthTOTAL =
                                  spacing - (value * spacing);

                              //CALC MOVE LEFT
                              double slider = 0.00;
                              if (valueB > 1) {
                                slider = (valueB - 1) * constraints.maxWidth;
                              }

                              final x = -(spacing - spaceFractionWidthTOTAL);
                              late double moveLeft = x - slider;
                              return Transform.translate(
                                offset: Offset(
                                  moveLeft,
                                  -spaceFractionHeightTOTAL + 5,
                                ),
                                child: OverflowBox(
                                  maxHeight: maxHeight,
                                  maxWidth: maxWidth,
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: fillWidthTOTAL,
                                    height: fillHeightTOTAL,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(
                                          borderRaius * value),
                                    ),
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 2,
                                      height: 6,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                        // PAGES
                        PageView.builder(
                          controller: _pageController,
                          itemCount: 4,
                          itemBuilder: (ctxt, index) {
                            switch (index) {
                              case 0:
                                return const SizedBox();
                              case 1:
                                return GestureDetector(
                                  onVerticalDragUpdate: (details) {
                                    final newcps =
                                        currentPage.value + details.delta.dy;

                                    _animationController.value =
                                        currentPage.value / maxHeight;

                                    currentPage.value =
                                        newcps.clamp(_heigthSocial, maxHeight);

                                    final range =
                                        maxHeight - (maxHeight * 0.40);
                                    if (details.globalPosition.dy > range) {
                                      _isTogglePage = true;
                                    } else {
                                      _isTogglePage = false;
                                    }
                                  },
                                  onVerticalDragEnd: (DragEndDetails details) {
                                    if (_isTogglePage) {
                                      _animationController.forward();
                                      currentPage.value = maxHeight;
                                    } else {
                                      _animationController.reverse();
                                      currentPage.value = _heigthSocial;
                                    }
                                  },
                                  child: BankCard(
                                    radio: borderRaius,
                                    text: '$index',
                                  ),
                                );
                              default:
                                return BankCard(
                                  radio: borderRaius,
                                  text: '$index',
                                );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
    this.text,
    required this.radio,
  }) : super(key: key);
  final String? text;
  final double radio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radio),
        color: Colors.yellow.withOpacity(0.75),
      ),
      child: Container(
        color: Colors.yellow,
        child: Text(
          text ?? '-',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
