import 'package:digital_currency/src/presenter/customs_widgets/shimmer_animation.dart';
import 'package:flutter/material.dart';

///
class CardWidget extends StatelessWidget {
  ///
  const CardWidget({
    Key? key,
    required this.amount,
    required this.base,
    required this.currency,
    required this.icon,
    this.height = 140,
    this.color = Colors.white,
  }) : super(key: key);

  ///
  final String amount;

  ///
  final String currency;

  ///
  final String base;

  ///
  final Widget icon;

  ///
  final double height;

  ///
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  child: icon,
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  child: Text(
                    currency,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 2,
                child: Text(
                  base,
                  style: const TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FittedBox(
                  child: Text(
                    amount,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
class CardShimmerLoading extends StatelessWidget {
  ///
  const CardShimmerLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ShimmerAnimation(
      color: Colors.white,
      height: 120,
      width: 120,
      borderRadius: 5,
    );
  }
}
