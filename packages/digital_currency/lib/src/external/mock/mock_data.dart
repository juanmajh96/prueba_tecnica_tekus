import 'dart:convert';

import 'package:digital_currency/src/data/datasource/datasource.dart';
import 'package:digital_currency/src/data/model/response_model.dart';
import 'package:digital_currency/src/domain/entities/request_entity.dart';

/* import 'package:http/http.dart' as http; */

///
class MockData implements DigitalCurrencyDatasource {
  ///
  /* const MockData(this._client);

  final http.Client _client; */
  @override
  Future<ResponseModel> getDatasource(RequestEntity requestEntity) async {
    final result =
        ResponseModel.fromJson(jsonDecode(response) as Map<String, dynamic>);
    return result;
  }
}

// ignore: public_member_api_docs
const response = '''
{
    "data": {
        "base": "BTC",
        "currency": "USD",
        "amount": "47663.74"
    }
}
''';
