import 'package:flutter/material.dart' show ScrollController, ValueNotifier;

///Controller for manager Scroll
class ScrollControllerDigitalCurrency {
  final _scrollController = ScrollController();
  final _scrollNotifier = ValueNotifier<double>(0);

  ///Access to ScrollController
  ScrollController get scrollController => _scrollController;

  ///Access to ValueNotifier
  ValueNotifier<double> get scrollNotifier => _scrollNotifier;

  ///Init lisening for  scrollController
  void initLisening() {
    scrollController.addListener(_onListen);
  }

  void _onListen() {
    scrollNotifier.value = scrollController.offset;
  }

  ///Call for destroyed
  void dispose() {
    scrollController.removeListener(_onListen);
  }
}
