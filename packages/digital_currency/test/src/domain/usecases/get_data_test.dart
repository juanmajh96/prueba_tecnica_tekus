import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../entities/request_entity.dart';
import '../entities/response_entity.dart';
import '../repositories/digital_currency_repositories.dart';

void main() {
  late DigitalCurrencyRepositoriesMock _repositories;
  late GetData _usecase;

  setUpAll(() {
    _repositories = DigitalCurrencyRepositoriesMock();
    _usecase = GetDataImpl(_repositories);
  });

  group('when its succesfull', () {
    test(
      'Its should return ResponseMapCustomerEntity if its succesfull',
      () async {
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => Right(responseEntity),
        );

        final _result = await _usecase(requestEntity);

        expect(_result.fold(id, id), isA<ResponseEntity>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );
  });

  group('when there are any error', () {
    test(
      'Its should return DigitalCurrencyError if It not work',
      () async {
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => const Left(DatasourceError()),
        );

        final _result = await _usecase(requestEntity);

        expect(_result.fold(id, id), isA<DatasourceError>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );

    test(
      'Its should return DigitalCurrencyError if It not work',
      () async {
        when(() => _repositories.getData(requestEntity)).thenAnswer(
          (_) async => const Left(InternetError()),
        );

        final _result = await _usecase(requestEntity);

        expect(_result.fold(id, id), isA<InternetError>());
        verify(() => _repositories.getData(requestEntity)).called(1);
      },
    );
  });
}
