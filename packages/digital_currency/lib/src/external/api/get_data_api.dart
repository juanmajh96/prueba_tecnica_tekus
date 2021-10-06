import 'dart:convert';

import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:http/http.dart' as http;

/// Get data from api
abstract class GetDataApi {
  ///Method to get data
  Future<ResponseModel> getDatasource(String date, {String? currency});
}

/// Implementation of interface [GetDataApi]
class GetDataApiImpl implements GetDataApi {
  /// Recibed http client
  GetDataApiImpl({required this.client});

  /// Http client variable
  final http.Client client;

  @override
  Future<ResponseModel> getDatasource(String date,
      {String? currency = 'USD'}) async {
    final _response = await client.get(
      Uri.parse(
          'https://api.coinbase.com/v2/prices/BTC-$currency/spot?date=$date'),
    );
    if (_response.statusCode == 200) {
      return ResponseModel.fromJson(
          jsonDecode(_response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw DatasourceError(
        messageError: 'failed server, status code ${_response.statusCode}',
      );
    }
  }
}
