import 'package:flutter/material.dart';

class RightToLeftRoute extends PageRouteBuilder {
  RightToLeftRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 400),
  }) : super(
          pageBuilder: (_, animation, ___) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: page,
          ),
          transitionDuration: duration,
          reverseTransitionDuration: duration,
        );

  final Widget page;
  final Duration duration;
}
