import 'package:flutter/material.dart';

///
class CustomListTitle extends StatelessWidget {
  ///
  const CustomListTitle({
    Key? key,
    required this.date,
    required this.currency,
    required this.amount,
    this.onTap,
  }) : super(key: key);

  ///
  final String date;

  ///
  final String currency;

  ///
  final String amount;

  ///
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
