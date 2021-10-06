import 'package:digital_currency/src/presenter/home_digital_currency/views/animation_for_head.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/views/body_digital_currency.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/views/head_digital_currency.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/views/persiten_header_digital_currency.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/views/title_head.dart';
import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

///
class HomeDigitalCurrency extends StatelessWidget {
  ///
  const HomeDigitalCurrency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inherited =
        InheritedDigitalCurrency.of(context)!.inheritedScrollController;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _inherited.scrollController,
              slivers: const [
                AnimationForHead(
                  head: HeadDigitalCurrency(),
                  titleHead: TitleHead(),
                ),
                PersistenHeaderDigitalCurrency(),
                BodyDigitalCurrency(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
