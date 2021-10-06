import 'package:flutter/material.dart';

/// Display custom list title
class CustomListTitle extends StatelessWidget {
  /// Recibed params
  const CustomListTitle({
    Key? key,
    required this.date,
    required this.currency,
    required this.amount,
    this.onTap,
  }) : super(key: key);

  /// Date
  final String date;

  /// Currency
  final String currency;

  ///Amount
  final String amount;

  /// Function onTap
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(date),
          ),
          Expanded(
            child: Text(currency),
          )
        ],
      ),
      trailing: Text(amount),
      onTap: onTap,
    );
  }
}
