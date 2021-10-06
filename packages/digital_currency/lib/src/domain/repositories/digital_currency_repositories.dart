import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';

/// interface for repository
abstract class DigitalCurrencyRepositories {
  ///[getData] get the data,this may return error or response,
  ///the response should be handled using the fold method
  Future<Either<DigitalCurrencyError, ResponseEntity>> getData(
    RequestEntity requestEntity,
  );

  /// Emits in real time  error or response
  Stream<Either<DigitalCurrencyError, ResponseEntity>> getDataRealTime(
    RequestEntity requestEntity,
  );

  /// Destroyed resource
  void disposeResource();
}
