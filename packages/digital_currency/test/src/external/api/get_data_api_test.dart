import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/domain.dart';
import 'package:digital_currency/src/external/api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../response/response_api.dart';

class HttpMock extends Mock implements http.Client {}

void main() {
  late GetDataApi _getDataApi;
  late HttpMock _client;
  setUpAll(() {
    _client = HttpMock();
    _getDataApi = GetDataApiImpl(client: _client);
  });

  group('when is succesfull', () {
    test('when status code is 200 return ResponseModel', () async {
      when(
        () => _client.get(
          Uri.parse(
              'https://api.coinbase.com/v2/prices/BTC-USD/spot?date=2021-10-05'),
        ),
      ).thenAnswer(
        (_) async => http.Response(responseApi, 200),
      );

      final _result = await _getDataApi.getDatasource('2021-10-05');

      expect(_result, isA<ResponseModel>());
    });

    test('when status code is 200 return ResponseModel, currency is set',
        () async {
      when(
        () => _client.get(
          Uri.parse(
              'https://api.coinbase.com/v2/prices/BTC-USD/spot?date=2021-10-05'),
        ),
      ).thenAnswer(
        (_) async => http.Response(responseApi, 200),
      );

      final _result =
          await _getDataApi.getDatasource('2021-10-05', currency: 'USD');

      expect(_result, isA<ResponseModel>());
    });
  });

  group('when it fails  ', () {
    test('when status code is not 200 return DatasourceError', () async {
      when(
        () => _client.get(
          Uri.parse(
              'https://api.coinbase.com/v2/prices/BTC-USD/spot?date=2021-10-05'),
        ),
      ).thenAnswer(
        (_) async => http.Response(responseApi, 500),
      );

      final _result = _getDataApi.getDatasource('2021-10-05', currency: 'USD');

      expect(_result, throwsA(isA<DatasourceError>()));
    });
  });
}
