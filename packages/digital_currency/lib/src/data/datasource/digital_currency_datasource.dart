import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';

///
abstract class DigitalCurrencyDatasource {
  ///
  Future<ResponseEntity> getDatasource(RequestEntity requestEntity);

  ///
  Stream<Either<DigitalCurrencyError, ResponseEntity>> datasourceRealTime(
    RequestEntity requestEntity,
  );

  ///
  void disposeResource();
}
