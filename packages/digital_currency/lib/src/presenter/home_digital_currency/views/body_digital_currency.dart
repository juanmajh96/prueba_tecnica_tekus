import 'package:digital_currency/src/presenter/details_digital_currency/_home_details_digital_currency.dart';
import 'package:flutter/material.dart';

///
class BodyDigitalCurrency extends StatelessWidget {
  ///
  const BodyDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text('$index de sep'),
              ),
              const Expanded(
                child: Text('BTC-USD'),
              )
            ],
          ),
          trailing: const Text('47.00.07'),
          onTap: () => showCustomDialog(context),
        );
      }, childCount: 20),
    );
  }
}
