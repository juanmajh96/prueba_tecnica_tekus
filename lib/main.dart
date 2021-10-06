import 'package:digital_currency/digital_currency.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Main MyApp
class MyApp extends StatelessWidget {
  /// MyApp constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: DigitalCurrency(),
    );
  }
}
