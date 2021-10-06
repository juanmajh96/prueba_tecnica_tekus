import 'package:dartz/dartz.dart';

import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[GetData] usecase return data
abstract class GetData {
  ///Get data
  Future<Either<DigitalCurrencyError, ResponseEntity>> call(
    RequestEntity requestEntity,
  );
}

/// Implementation to get Data
class GetDataImpl implements GetData {
  /// Recibed [DigitalCurrencyRepositories]
  const GetDataImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  Future<Either<DigitalCurrencyError, ResponseEntity>> call(
          RequestEntity requestEntity) async =>
      _repositories.getData(requestEntity);
}
