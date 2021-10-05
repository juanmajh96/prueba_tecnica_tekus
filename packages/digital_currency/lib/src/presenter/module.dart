import 'package:digital_currency/src/presenter/home_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/views/views.dart';
import 'package:flutter/material.dart';

///
class DigitalCurrency extends StatefulWidget {
  ///
  const DigitalCurrency({Key? key}) : super(key: key);

  @override
  _DigitalCurrencyState createState() => _DigitalCurrencyState();
}

class _DigitalCurrencyState extends State<DigitalCurrency> {
  late ScrollControllerDigitalCurrency _scrollControllerDigitalCurrency;

  @override
  void initState() {
    _scrollControllerDigitalCurrency = ScrollControllerDigitalCurrency()
      ..initLisening();
    super.initState();
  }

  @override
  void dispose() {
    _scrollControllerDigitalCurrency.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedDigitalCurrency(
      inheritedScrollController: _scrollControllerDigitalCurrency,
      child: const HomeDigitalCurrency(),
    );
  }
}

///class that allows those classes to extend the information
///under the tree from it.
class InheritedDigitalCurrency extends InheritedWidget {
  /// child is the widget under the tree
  const InheritedDigitalCurrency({
    Key? key,
    required final Widget child,
    required this.inheritedScrollController,
  }) : super(key: key, child: child);

  ///information that We want extend
  final ScrollControllerDigitalCurrency inheritedScrollController;

  ///access to information
  static InheritedDigitalCurrency? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
