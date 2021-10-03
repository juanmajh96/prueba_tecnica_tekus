import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/digital_currency_errors.dart';
import 'package:digital_currency/src/domain/repositories/repositories.dart';

///
class DigitalCurrencyRepository implements DigitalCurrencyRepositories {
  ///
  const DigitalCurrencyRepository(this._datasource);

  final DigitalCurrencyDatasource _datasource;
  @override
  Future<Either<DigitalCurrencyError, ResponseEntity>> getData(
      RequestEntity requestEntity) async {
    try {
      final _result = await _datasource.getDatasource(requestEntity);
      return Right(_result);
    } on SocketException {
      return const Left(
        InternetError(),
      );
    } catch (e) {
      return Left(
        DatasourceError(messageError: e.toString()),
      );
    }
  }
}
