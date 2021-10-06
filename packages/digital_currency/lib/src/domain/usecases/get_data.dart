import 'package:dartz/dartz.dart';

import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[GetData] usecase return data
abstract class GetData {
  ///
  Future<Either<DigitalCurrencyError, ResponseEntity>> call(
    RequestEntity requestEntity,
  );
}

///
class GetDataImpl implements GetData {
  ///
  const GetDataImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  Future<Either<DigitalCurrencyError, ResponseEntity>> call(
          RequestEntity requestEntity) async =>
      _repositories.getData(requestEntity);
}
