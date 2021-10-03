import 'package:digital_currency/src/domain/entities/entities.dart';

///model for data
class DataEntityModel extends DataEntity {
  ///Use super to save variable in entity
  const DataEntityModel({
    required final String base,
    required final String currency,
    required final double amount,
  }) : super(
          base: base,
          currency: currency,
          amount: amount,
        );

  factory DataEntityModel.fromJson(Map<String, dynamic> json) =>
      DataEntityModel(
        base: json['base'] as String,
        currency: json['currency'] as String,
        amount: json['amount'] as double,
      );
}
