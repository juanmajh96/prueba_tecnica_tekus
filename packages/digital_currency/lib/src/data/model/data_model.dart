import 'package:digital_currency/src/domain/entities/entities.dart';

///Model for data
class DataModel extends DataEntity {
  ///Use super to save variable in entity
  DataModel({
    required final String base,
    required final String currency,
    required final String amount,
  }) : super(
          base: base,
          currency: currency,
          amount: amount,
          date: '',
        );

  ///[DataModel.fromJson] interface to create DataModel object
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        base: json['base'] as String,
        currency: json['currency'] as String,
        amount: json['amount'] as String,
      );
}
