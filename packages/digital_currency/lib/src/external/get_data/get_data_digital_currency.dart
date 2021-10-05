import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/domain/domain.dart';
import 'package:digital_currency/src/domain/entities/request_entity.dart';
import 'package:digital_currency/src/external/api/api.dart';
import 'package:digital_currency/src/external/local_date/local_date.dart';

///
class GetDataDigitalCurrency implements DigitalCurrencyDatasource {
  ///
  GetDataDigitalCurrency({
    required this.api,
    required this.localDateUtil,
  });

  ///
  final GetLatestTwoWeeks api;

  ///
  final LocalDateUtil localDateUtil;

  @override
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity) async {
    final _responseModel = ResponseEntity(dataEntityList: <DataEntity>[]);
    var _dateSubtract = localDateUtil.subtractOneDayFromDate(
      localDateUtil.getDataTimeNow(),
    );
    if (requestEntity.requestDetails) {
      final listCurrency = ['EUR', 'USD', 'COP'];
      for (var i = 0; i < 3; i++) {
        final _result = await api.getDatasource(
          requestEntity.date!,
          currency: listCurrency[i],
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
}
