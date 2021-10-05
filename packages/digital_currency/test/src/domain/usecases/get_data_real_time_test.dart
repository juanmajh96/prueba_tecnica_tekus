import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:digital_currency/src/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../entities/request_entity.dart';
import '../repositories/digital_currency_repositories.dart';

void main() {
  late DigitalCurrencyRepositoriesMock _repositories;
  late GetDataRealTime _usecase;
  late DigitalCurrencyError _error;
  late ResponseEntity _response;
  final _streamController =
      StreamController<Either<DigitalCurrencyError, ResponseEntity>>();
  final _stream$ = _streamController.stream.asBroadcastStream();
  late List<Either<DigitalCurrencyError, ResponseEntity>> _listEmits;

  setUpAll(() {
    _repositories = DigitalCurrencyRepositoriesMock();
    _usecase = GetDataRealTimeImpl(_repositories);
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

  test(
    'Its emit data or error, and Its should emit in orden ',
    () async {
      when(() => _repositories.getDataRealTime(requestEntity)).thenAnswer(
        (_) => _stream$,
      );

      final _result = _usecase(requestEntity);

      await expectLater(
        _result,
        emitsInOrder(_listEmits),
      );

      verify(() => _repositories.getDataRealTime(requestEntity)).called(1);
    },
  );
}
