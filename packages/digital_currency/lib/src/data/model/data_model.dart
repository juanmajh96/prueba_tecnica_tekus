import 'package:digital_currency/src/domain/entities/entities.dart';

///model for data
class DataModel extends DataEntity {
  ///Use super to save variable in entity
  const DataModel({
    required final String base,
    required final String currency,
    required final double amount,
  }) : super(
          base: base,
          currency: currency,
          amount: amount,
        );

  ///[DataModel.fromJson] interface to create DataModel object
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        base: json['base'] as String,
        currency: json['currency'] as String,
        amount: json['amount'] as double,
      );
}
