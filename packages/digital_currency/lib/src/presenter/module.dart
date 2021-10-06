import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/data/repository/repository.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';
import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:digital_currency/src/external/api/api.dart';
import 'package:digital_currency/src/external/get_data/get_data.dart';
import 'package:digital_currency/src/external/local_date/local_date.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/controllers/controllers.dart';
import 'package:digital_currency/src/presenter/home_digital_currency/home_digital_currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///DigitalCurrency module
class DigitalCurrency extends StatefulWidget {
  ///Constructor of module
  const DigitalCurrency({Key? key}) : super(key: key);

  @override
  _DigitalCurrencyState createState() => _DigitalCurrencyState();
}

class _DigitalCurrencyState extends State<DigitalCurrency> {
  ///Dependencies
  late ScrollControllerDigitalCurrency _scrollControllerDigitalCurrency;
  late DigitalCurrencyRepositories _repositories;
  late DigitalCurrencyDatasource _datasource;
  /* late GetDataApi _api; */
  late LocalDateUtil _localDate;
  late GetData _getData;
  late BodyBloc _bodyBloc;
  late GetDataRealTime _getDataRealTime;
  late HeaderBloc _headerBloc;
  late DisposeResource _disposeResource;

  late GetDataApi _api;

  @override
  void initState() {
    ///Dependencies inyection
    _scrollControllerDigitalCurrency = ScrollControllerDigitalCurrency()
      ..initLisening();
    _api = GetDataApiImpl(
      client: http.Client(),
    );
    _localDate = LocalDateUtilImpl();
    _datasource = GetDataDigitalCurrency(
      api: _api,
      localDateUtil: _localDate,
    );
    _repositories = DigitalCurrencyRepository(_datasource);
    _getData = GetDataImpl(_repositories);
    _disposeResource = DisposeResourceImpl(_repositories);
    _getDataRealTime = GetDataRealTimeImpl(_repositories);
    _bodyBloc = BodyBloc(getData: _getData)..getDataBloc();
    _headerBloc = HeaderBloc(getDataRealTime: _getDataRealTime);

    super.initState();
  }

  @override
  void dispose() {
    ///Destroyed resource
    _scrollControllerDigitalCurrency.dispose();
    _headerBloc.dispose();
    _disposeResource();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///extend objects under the tree widget
    return InheritedDigitalCurrency(
      inheritedScrollController: _scrollControllerDigitalCurrency,
      bodyBloc: _bodyBloc,
      getData: _getData,
      headerBloc: _headerBloc,
      child: const HomeDigitalCurrency(),
    );
  }
}

///Class that allows those classes to extend the information
///Under the tree from it.
class InheritedDigitalCurrency extends InheritedWidget {
  /// Child is the widget under the tree
  const InheritedDigitalCurrency({
    Key? key,
    required final Widget child,
    required this.inheritedScrollController,
    required this.bodyBloc,
    required this.getData,
    required this.headerBloc,
  }) : super(key: key, child: child);

  ///Information that We want extend
  /// Controller object
  final ScrollControllerDigitalCurrency inheritedScrollController;

  ///State manager object
  final BodyBloc bodyBloc;

  ///State manager object
  final HeaderBloc headerBloc;

  ///Usecase
  final GetData getData;

  ///Access to information
  static InheritedDigitalCurrency? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
