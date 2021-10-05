import 'package:dartz/dartz.dart';

import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[GetDataRealTime] usecase return data
abstract class GetDataRealTime {
  ///
  Stream<Either<DigitalCurrencyError, ResponseEntity>> call(
    RequestEntity requestEntity,
  );
}

///
class GetDataRealTimeImpl implements GetDataRealTime {
  ///
  const GetDataRealTimeImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  Stream<Either<DigitalCurrencyError, ResponseEntity>> call(
      RequestEntity requestEntity) async* {
    yield* _repositories.getDataRealTime(requestEntity);
  }
}
