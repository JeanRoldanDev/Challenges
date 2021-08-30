import 'package:flutter/cupertino.dart';

class FadeRoute extends PageRouteBuilder {
  FadeRoute({
    required this.page,
    this.duration = const Duration(milliseconds: 600),
  }) : super(
          pageBuilder: (_, animation, ___) => FadeTransition(
            opacity: animation,
            child: page,
          ),
          transitionDuration: duration,
        );

  final Widget page;
  final Duration duration;
}
