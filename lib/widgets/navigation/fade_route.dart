import 'package:flutter/cupertino.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
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
}
