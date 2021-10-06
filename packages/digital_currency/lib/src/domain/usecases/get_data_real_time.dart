import 'package:dartz/dartz.dart';

import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';

///[GetDataRealTime] usecase return real time data
abstract class GetDataRealTime {
  /// stream flow real time
  Stream<Either<DigitalCurrencyError, ResponseEntity>> call(
    RequestEntity requestEntity,
  );
}

/// implementation for interface [GetDataRealTime]
class GetDataRealTimeImpl implements GetDataRealTime {
  ///recibed [DigitalCurrencyRepositories]
  const GetDataRealTimeImpl(this._repositories);

  final DigitalCurrencyRepositories _repositories;

  @override
  Stream<Either<DigitalCurrencyError, ResponseEntity>> call(
      RequestEntity requestEntity) async* {
    yield* _repositories.getDataRealTime(requestEntity);
  }
}
