import 'package:digital_currency/src/presenter/customs_widgets/card_widget.dart';
import 'package:digital_currency/src/presenter/customs_widgets/custom_error_widget.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

/// Display States head
class HeadDigitalCurrency extends StatelessWidget {
  ///Constructor
  const HeadDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _headerBloc = InheritedDigitalCurrency.of(context)!.headerBloc;
    return ValueListenableBuilder(
      valueListenable: _headerBloc.state,
      builder: (context, state, child) {
        if (state is CompleteStateHeader) {
          return Row(
            children: [
              const SizedBox(width: 10),
              CardWidget(
                amount: state.listData[0].amount,
                icon: const Text('🇪🇺', style: TextStyle(fontSize: 25)),
                currency: state.listData[0].currency,
                base: state.listData[0].base,
              ),
              const SizedBox(width: 10),
              CardWidget(
                amount: state.listData[1].amount,
                icon: const Text('🇺🇸', style: TextStyle(fontSize: 25)),
                currency: state.listData[1].currency,
                base: state.listData[1].base,
              ),
              const SizedBox(width: 10),
              CardWidget(
                amount: state.listData[2].amount
                    .substring(0, state.listData[2].amount.length - 6),
                icon: const Text('🇨🇴 ', style: TextStyle(fontSize: 25)),
                currency: state.listData[2].currency,
                base: state.listData[2].base,
              ),
              const SizedBox(width: 10),
            ],
          );
        }
        if (state is ErrorStateHeader) {
          return Center(
            child: CustomErrorWidget(
              digitalCurrencyError: state.error,
            ),
          );
        }
        return Row(
          children: const [
            SizedBox(width: 10),
            CardShimmerLoading(
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            CardShimmerLoading(
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            CardShimmerLoading(
              color: Colors.grey,
            ),
            SizedBox(width: 10),
          ],
        );
      },
    );
  }
}
