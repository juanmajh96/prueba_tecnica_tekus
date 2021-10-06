import 'package:digital_currency/src/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../repositories/digital_currency_repositories.dart';

void main() {
  late DigitalCurrencyRepositoriesMock _repositories;
  late DisposeResource _usecase;

  setUpAll(() {
    _repositories = DigitalCurrencyRepositoriesMock();
    _usecase = DisposeResourceImpl(_repositories);
  });
  test(
    'veryft disposeResource called one time',
    () async {
      when(() => _repositories.disposeResource()).thenAnswer((invocation) {});

      _usecase();

      verify(() => _repositories.disposeResource()).called(1);
    },
  );
}
