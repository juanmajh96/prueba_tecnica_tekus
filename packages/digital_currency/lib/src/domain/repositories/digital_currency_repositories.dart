import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';

/// interface for repository
abstract class DigitalCurrencyRepositories {
  ///[getData] get the data,this may return error or response,
  Future<Either<DigitalCurrencyError, ResponseEntity>> getData(
    RequestEntity requestEntity,
  );
}
