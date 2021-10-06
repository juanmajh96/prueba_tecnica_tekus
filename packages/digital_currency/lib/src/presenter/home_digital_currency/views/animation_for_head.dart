import 'dart:math';
import 'dart:ui';

import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

const _headerSize = 220.0;
const _space = _headerSize - 2.3 * kToolbarHeight;

///Animated Header
class AnimationForHead extends StatelessWidget {
  ///Recibed params
  const AnimationForHead({
    required this.titleHead,
    required this.head,
    Key? key,
  }) : super(key: key);

  /// Title on top head
  final Widget titleHead;

  /// Principal Widget in center head
  final Widget head;

  @override
  Widget build(BuildContext context) {
    final _inherited =
        InheritedDigitalCurrency.of(context)!.inheritedScrollController;
    return ValueListenableBuilder<double>(
      valueListenable: _inherited.scrollNotifier,
      child: head,
      builder: (context, value, child) {
        final percent =
            lerpDouble(0.0, -pi / 2, (value / _space).clamp(0.0, 1.0))!;
        final opacity = lerpDouble(1.0, 0.0, (value / _space).clamp(0.0, 1.0))!;
        return SliverAppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: titleHead,
          expandedHeight: _headerSize,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.blurBackground],
            background: Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight + 10,
                bottom: kToolbarHeight / 4,
              ),
              child: Center(
                child: Opacity(
                  opacity: opacity,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.003)
                      ..rotateX(percent),
                    alignment: Alignment.center,
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
