import 'package:digital_currency/src/presenter/customs_widgets/card_widget.dart';
import 'package:flutter/material.dart';

///
class BodyDetailsDigitalCurrency extends StatelessWidget {
  ///
  const BodyDetailsDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 200,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
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
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text(
                    '0 de Sep',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
