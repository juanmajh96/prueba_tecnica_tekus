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

///
class DigitalCurrency extends StatefulWidget {
  ///
  const DigitalCurrency({Key? key}) : super(key: key);

  @override
  _DigitalCurrencyState createState() => _DigitalCurrencyState();
}

class _DigitalCurrencyState extends State<DigitalCurrency> {
  ///dependencies
  late ScrollControllerDigitalCurrency _scrollControllerDigitalCurrency;
  late DigitalCurrencyRepositories _repositories;
  late DigitalCurrencyDatasource _datasource;
  late GetData _getData;
  late BodyBloc _bodyBloc;
  late GetLatestTwoWeeks _api;
  late LocalDateUtil _localDate;

  @override
  void initState() {
    ///dependencies inyection
    _scrollControllerDigitalCurrency = ScrollControllerDigitalCurrency()
      ..initLisening();
    _api = GetLatestTwoWeeksImpl(
      client: http.Client(),
    );
    _localDate = LocalDateUtilImpl();
    _datasource = GetDataDigitalCurrency(
      api: _api,
      localDateUtil: _localDate,
    );
    _repositories = DigitalCurrencyRepository(_datasource);
    _getData = GetDataImpl(_repositories);
    _bodyBloc = BodyBloc(getData: _getData)..getDataBloc();
    super.initState();
  }

  @override
  void dispose() {
    ///destroyed resource in controller
    _scrollControllerDigitalCurrency.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///extend objects under the tree widget
    return InheritedDigitalCurrency(
      inheritedScrollController: _scrollControllerDigitalCurrency,
      bodyBloc: _bodyBloc,
      getData: _getData,
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
    required this.bodyBloc,
    required this.getData,
  }) : super(key: key, child: child);

  ///information that We want extend
  /// controller object
  final ScrollControllerDigitalCurrency inheritedScrollController;

  ///state manager object
  final BodyBloc bodyBloc;

  ///usecase
  final GetData getData;

  ///access to information
  static InheritedDigitalCurrency? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
