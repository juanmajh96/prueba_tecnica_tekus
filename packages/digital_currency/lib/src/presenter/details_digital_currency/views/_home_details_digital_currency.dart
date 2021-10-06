import 'dart:ui';

import 'package:digital_currency/src/domain/domain.dart';
import 'package:digital_currency/src/presenter/details_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/details_digital_currency/views/body_details_digital_currency.dart';
import 'package:digital_currency/src/presenter/module.dart';
import 'package:flutter/material.dart';

///Display ShowDialog
void showCustomDialog(BuildContext context, DataEntity dataEntity) =>
    showGeneralDialog(
      barrierLabel: 'Barrier',
      barrierDismissible: true,
      barrierColor: Colors.black26,
      transitionDuration: const Duration(milliseconds: 425),
      context: context,
      pageBuilder: (_, __, ___) => ModuleDetailsDigitalCurrency(
        dataEntity: dataEntity,
        getData: InheritedDigitalCurrency.of(context)!.getData,
      ),
      transitionBuilder: (_, anim, __, child) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4 * anim.value,
            sigmaY: 4 * anim.value,
          ),
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(anim),
            child: child,
          ),
        );
      },
    );

/// Create widget with state for created one time instance bloc
class ModuleDetailsDigitalCurrency extends StatefulWidget {
  ///Recibed params
  const ModuleDetailsDigitalCurrency({
    Key? key,
    required this.dataEntity,
    required this.getData,
  }) : super(key: key);

  /// Entity
  final DataEntity dataEntity;

  /// Usecase
  final GetData getData;

  @override
  _ModuleDetailsDigitalCurrencyState createState() =>
      _ModuleDetailsDigitalCurrencyState();
}

class _ModuleDetailsDigitalCurrencyState
    extends State<ModuleDetailsDigitalCurrency> {
  late DetailsBloc _detailsBloc;

  @override
  void initState() {
    _detailsBloc = DetailsBloc(getData: widget.getData)
      ..getDataBloc(widget.dataEntity.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedDetailsDigitalCurrency(
      detailsBloc: _detailsBloc,
      child: const BodyDetailsDigitalCurrency(),
    );
  }
}

///Under the tree from it.
class InheritedDetailsDigitalCurrency extends InheritedWidget {
  /// Child is the widget under the tree
  const InheritedDetailsDigitalCurrency({
    Key? key,
    required final Widget child,
    required this.detailsBloc,
  }) : super(key: key, child: child);

  ///Information that We want extend
  ///State manager object
  final DetailsBloc detailsBloc;

  ///Access to information
  static InheritedDetailsDigitalCurrency? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
