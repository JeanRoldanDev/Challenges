import 'package:challenges/6_streaming/helpers/helpers.dart';
import 'package:challenges/6_streaming/pages/explorer_page.dart';
import 'package:challenges/6_streaming/pages/home_page.dart';
import 'package:challenges/6_streaming/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StreamingApp extends StatelessWidget {
  StreamingApp({Key? key});
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUI);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.bg1),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              itemCount: 2,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {},
              itemBuilder: (_, indexPage) {
                switch (indexPage) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const ExplorePage();
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
            const Positioned(left: 0, right: 0, child: HeaderStreaming()),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: BottonNavigationStreaming(
                ontap: (int index) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.linear,
                  );
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.07,
              child: const BottonNavigationCenter(),
            ),
          ],
        ),
      ),
    );
  }
}
