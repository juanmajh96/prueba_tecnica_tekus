import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';

/// data source for digital currency
abstract class DigitalCurrencyDatasource {
  ///Data source return ResponseEntity containing List<DataEntity>
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity);

  ///Data source return ResponseEntity containing List<DataEntity>,
  ///its work in real time
  Stream<Either<DigitalCurrencyError, ResponseEntity>> datasourceRealTime(
    RequestEntity requestEntity,
  );

  /// destroyed resource
  void disposeResource();
}
