import 'package:flutter/material.dart' show ScrollController, ValueNotifier;

///
class ScrollControllerDigitalCurrency {
  final _scrollController = ScrollController();
  final _scrollNotifier = ValueNotifier<double>(0);

  ///access to ScrollController
  ScrollController get scrollController => _scrollController;

  ///access to ValueNotifier
  ValueNotifier<double> get scrollNotifier => _scrollNotifier;

  ///init lisening for  scrollController
  void initLisening() {
    scrollController.addListener(_onListen);
  }

  void _onListen() {
    scrollNotifier.value = scrollController.offset;
  }

  ///call for destroyed
  void dispose() {
    scrollController.removeListener(_onListen);
  }
}
