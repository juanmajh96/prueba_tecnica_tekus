import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/data/repository/repository.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/entities/request_entity.dart';
import '../model/response_model.dart';

class DigitalCurrencyDatasourceMock
    with Mock
    implements DigitalCurrencyDatasource {}

void main() {
  late DigitalCurrencyDatasourceMock _datasource;
  late DigitalCurrencyRepository _repository;
  setUpAll(() {
    _datasource = DigitalCurrencyDatasourceMock();
    _repository = DigitalCurrencyRepository(_datasource);
  });

  group('when its succesfull', () {
    test('its should return ResponseModel object', () async {
      when(() => _datasource.getDatasource(requestEntity)).thenAnswer(
        (_) async => responseModel,
      );

      final _result = await _repository.getData(requestEntity);

      expect(_result.fold(id, id), isA<ResponseModel>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });
  });

  group('when there are any error', () {
    test('when is DatasourceError', () async {
      when(() => _datasource.getDatasource(requestEntity))
          .thenThrow(const DatasourceError());

      final _result = await _repository.getData(requestEntity);

      expect(_result.fold(id, id), isA<DatasourceError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });

    test('when is InternetError', () async {
      when(() => _datasource.getDatasource(requestEntity)).thenThrow(
        const SocketException(''),
      );

      final _result = await _repository.getData(requestEntity);

      expect(_result.fold(id, id), isA<InternetError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });
  });
}
