import 'package:flutter/material.dart';

///Custom Animation for loading page
class ShimmerAnimation extends StatelessWidget {
  /// Customer your chimmer
  const ShimmerAnimation({
    Key? key,
    this.height = 30,
    this.width = 200,
    this.color = Colors.grey,
    this.borderRadius = 0,
    this.padding,
    this.margin,
  }) : super(key: key);

  /// Size of widget
  final double height;

  /// Size of widget
  final double width;

  /// Defined color widget
  final Color color;

  /// Defined the border widget
  final double borderRadius;

  /// Definned padding optional
  final EdgeInsetsGeometry? padding;

  /// Definned margin optional
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    var _end = 1.0;
    return StatefulBuilder(
      builder: (_, update) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 850),
          tween: Tween<double>(begin: 0, end: _end),
          onEnd: () {
            update(() {
              _end = _end == 0.0 ? 1.0 : 0.0;
            });
          },
          builder: (_, double value, __) {
            return Container(
              padding: padding,
              margin: margin,
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                gradient: LinearGradient(
                  colors: <Color>[
                    color.withOpacity(0.3),
                    color.withOpacity(0.7),
                    color,
                    color.withOpacity(0.7),
                    color.withOpacity(0.3),
                  ],
                  stops: <double>[
                    0,
                    value,
                    value,
                    value,
                    1,
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
