import 'dart:convert';

import 'package:digital_currency/src/data/model/model.dart';
import 'package:digital_currency/src/domain/errors/errors.dart';
import 'package:http/http.dart' as http;

///
abstract class GetDataApi {
  ///
  Future<ResponseModel> getDatasource(String date, {String? currency});
}

///
class GetDataApiImpl implements GetDataApi {
  ///
  GetDataApiImpl({required this.client});

  ///
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
