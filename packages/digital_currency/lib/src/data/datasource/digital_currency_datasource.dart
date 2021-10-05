import 'package:digital_currency/src/domain/entities/entities.dart';

///
abstract class DigitalCurrencyDatasource {
  ///
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity);
}
