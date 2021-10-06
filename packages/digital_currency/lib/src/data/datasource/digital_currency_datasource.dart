import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';

/// Data source for digital currency
abstract class DigitalCurrencyDatasource {
  ///Data source return ResponseEntity containing List<DataEntity>
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity);

  ///Data source return ResponseEntity containing List<DataEntity>,
  ///Its work in real time
  Stream<Either<DigitalCurrencyError, ResponseEntity>> datasourceRealTime(
    RequestEntity requestEntity,
  );

  /// Destroyed resource
  void disposeResource();
}
