import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/data/repository/repository.dart';
import 'package:digital_currency/src/domain/entities/entities.dart';
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
  late DigitalCurrencyError _error;
  late ResponseEntity _response;
  final _streamController =
      StreamController<Either<DigitalCurrencyError, ResponseEntity>>();
  final _stream$ = _streamController.stream.asBroadcastStream();
  late List<Either<DigitalCurrencyError, ResponseEntity>> _listEmits;
  setUpAll(() {
    _datasource = DigitalCurrencyDatasourceMock();
    _repository = DigitalCurrencyRepository(_datasource);
    _error = const DatasourceError(messageError: 'error');
    _response = ResponseEntity(dataEntityList: []);
    _listEmits = [
      Right<DigitalCurrencyError, ResponseEntity>(_response),
      Left<DigitalCurrencyError, ResponseEntity>(_error),
    ];
  });

  setUp(() {
    _streamController
      ..add(
        Right<DigitalCurrencyError, ResponseEntity>(_response),
      )
      ..add(
        Left<DigitalCurrencyError, ResponseEntity>(_error),
      );
  });

  tearDownAll(_streamController.close);

  group('when its succesfull', () {
    test('its should return ResponseModel object', () async {
      when(() => _datasource.getDatasource(requestEntity))
          .thenAnswer((_) async => responseModel);

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

    test('when is InternetError', () async {
      when(() => _datasource.getDatasource(requestEntity)).thenThrow(
        TypeError(),
      );

      final _result = await _repository.getData(requestEntity);

      expect(_result.fold(id, id), isA<DatasourceError>());
      verify(() => _datasource.getDatasource(requestEntity)).called(1);
    });
  });

  group('StreamTest', () {
    test('emits in orden data or error', () async {
      when(() => _datasource.datasourceRealTime(requestEntity))
          .thenAnswer((_) => _stream$);
      final _result = _repository.getDataRealTime(requestEntity);
      await expectLater(
        _result,
        emitsInOrder(_listEmits),
      );

      verify(() => _datasource.datasourceRealTime(requestEntity)).called(1);
    });
  });

  group('dispose', () {
    test('datasource is called', () {
      when(() => _datasource.disposeResource()).thenAnswer((invocation) {});
      _repository.disposeResource();
      verify(() => _datasource.disposeResource()).called(1);
    });
  });
}
