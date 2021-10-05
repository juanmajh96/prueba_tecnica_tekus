import 'package:digital_currency/src/presenter/customs_widgets/card_widget.dart';
import 'package:flutter/material.dart';

///
class HeadDigitalCurrency extends StatelessWidget {
  ///
  const HeadDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Spacer(),
        CardWidget(
          amount: '47.800.87',
          icon: Text('🇺🇸', style: TextStyle(fontSize: 25)),
          currency: 'USD',
          base: 'BTC',
        ),
        Spacer(),
        CardWidget(
          amount: '30.050.04',
          icon: Text('🇪🇺', style: TextStyle(fontSize: 25)),
          currency: 'EUR',
          base: 'BTC',
        ),
        Spacer(),
        CardWidget(
          amount: '180.000.000',
          icon: Text('🇨🇴 ', style: TextStyle(fontSize: 25)),
          currency: 'COP',
          base: 'BTC',
        ),
        Spacer(),
      ],
    );
  }
}
