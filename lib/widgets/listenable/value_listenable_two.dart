import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ValueListenableBuilderTwo<A, B> extends StatelessWidget {
  ValueListenableBuilderTwo({
    Key? key,
    required this.valueListenablefirst,
    required this.valueListenableSecond,
    required this.builder,
    this.child,
  }) : super(key: key);

  final ValueListenable<A> valueListenablefirst;
  final ValueListenable<B> valueListenableSecond;
  final Widget? child;
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: valueListenablefirst,
      builder: (_, a, __) {
        return ValueListenableBuilder<B>(
          valueListenable: valueListenableSecond,
          builder: (context, b, __) {
            return builder(context, a, b, child);
          },
        );
      },
    );
  }
}
