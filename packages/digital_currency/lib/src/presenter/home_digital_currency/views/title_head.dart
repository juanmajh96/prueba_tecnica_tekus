import 'package:digital_currency/src/presenter/customs_widgets/shimmer_animation.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

/// Defined the title top in header
class TitleHead extends StatelessWidget {
  ///Constructor
  const TitleHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headerBloc = InheritedDigitalCurrency.of(context)!.headerBloc;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            const Text(
              'Today  ',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _headerBloc.state,
              builder: (context, state, child) {
                if (state is CompleteStateHeader) {
                  return Text(
                    state.listData[0].date,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                  );
                }
                if (state is ErrorStateHeader) {
                  return const SizedBox.shrink();
                }
                return const ShimmerAnimation(
                  height: 20,
                  width: 95,
                  borderRadius: 5,
                );
              },
            ),
          ],
        ),
        Row(
          children: const [
            Image(
              height: 35,
              width: 35,
              image: AssetImage(
                'assets/bitcoin.png',
                package: 'digital_currency',
              ),
            ),
            Text(
              'Bitcoin',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black45,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
