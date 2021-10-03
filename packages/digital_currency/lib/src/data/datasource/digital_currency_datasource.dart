import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';

///
abstract class DigitalCurrencyDatasource {
  ///
  Future<ResponseModel> getDatasource(RequestEntity requestEntity);
}
