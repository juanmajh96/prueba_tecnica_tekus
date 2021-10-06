import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:flutter/material.dart';

/// Widget for manager custom erros app,
class CustomErrorWidget extends StatelessWidget {
  ///Recibed intance DigitalCurrencyError and define the type error
  const CustomErrorWidget({Key? key, required this.digitalCurrencyError})
      : super(key: key);

  /// Error to defined
  final DigitalCurrencyError digitalCurrencyError;

  @override
  Widget build(BuildContext context) {
    if (digitalCurrencyError is DatasourceError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Expanded(
            child: Icon(
              Icons.nearby_error_outlined,
              color: Colors.orange,
              size: 100,
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              (digitalCurrencyError as DatasourceError).messageError!,
            ),
          ),
          const Spacer()
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Expanded(
          child: Icon(
            Icons.signal_wifi_connected_no_internet_4_sharp,
            color: Colors.orange,
            size: 100,
          ),
        ),
        const Spacer(),
        Center(
          child: Text(
            (digitalCurrencyError as InternetError).messageError!,
          ),
        ),
        const Spacer()
      ],
    );
  }
}
