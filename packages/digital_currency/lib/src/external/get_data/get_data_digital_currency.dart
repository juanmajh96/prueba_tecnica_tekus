import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/domain/domain.dart';
import 'package:digital_currency/src/domain/entities/request_entity.dart';
import 'package:digital_currency/src/external/api/api.dart';
import 'package:digital_currency/src/external/local_date/local_date.dart';

const _listCurrency = ['EUR', 'USD', 'COP'];

///External getData
class GetDataDigitalCurrency implements DigitalCurrencyDatasource {
  ///Recibed api and localdateUtil
  GetDataDigitalCurrency({
    required this.api,
    required this.localDateUtil,
  }) : super() {
    _timer = Timer.periodic(
      const Duration(seconds: 60),
      (timer) async {
        await dataRealTime();
      },
    );
  }

  /// Interface for called api
  final GetDataApi api;

  /// Interface for called date utils
  final LocalDateUtil localDateUtil;

  late Timer _timer;

  final _streamController =
      StreamController<Either<DigitalCurrencyError, ResponseEntity>>();

  /// Stream for emit data
  Stream<Either<DigitalCurrencyError, ResponseEntity>> get yieldStream =>
      _streamController.stream;

  @override
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity) async {
    final _responseModel = ResponseEntity(dataEntityList: <DataEntity>[]);
    var _dateSubtract = localDateUtil.subtractOneDayFromDate(
      localDateUtil.getDataTimeNow(),
    );
    if (requestEntity.requestDetails) {
      for (var i = 0; i < 3; i++) {
        final _result = await api.getDatasource(
          requestEntity.date!,
          currency: _listCurrency[i],
        );
        _result.dataEntityList[0].date = requestEntity.date!;
        _responseModel.dataEntityList.addAll(_result.dataEntityList);
      }
      return _responseModel;
    } else {
      for (var i = 0; i < 19; i++) {
        final _date = localDateUtil.formattedDate(_dateSubtract);
        final _result = await api.getDatasource(_date);
        _result.dataEntityList[0].date = _date;
        _responseModel.dataEntityList.addAll(_result.dataEntityList);
        _dateSubtract = localDateUtil.subtractOneDayFromDate(_dateSubtract);
      }
      return _responseModel;
    }
  }

  @override
  Stream<Either<DigitalCurrencyError, ResponseEntity>> datasourceRealTime(
      RequestEntity requestEntity) async* {
    await dataRealTime();

    yield* yieldStream;
  }

  /// Get usd,eur,cop currency ,then emit list of these
  Future<void> dataRealTime() async {
    final _responseModel = ResponseEntity(dataEntityList: <DataEntity>[]);
    final _date = localDateUtil.formattedDate(localDateUtil.getDataTimeNow());
    for (var i = 0; i < 3; i++) {
      final _result = await api.getDatasource(
        _date,
        currency: _listCurrency[i],
      );
      _result.dataEntityList[0].date = _date;
      _responseModel.dataEntityList.addAll(_result.dataEntityList);
    }
    _streamController.sink.add(Right(_responseModel));
  }

  @override
  void disposeResource() {
    _streamController.close();
    _timer.cancel();
  }
}
