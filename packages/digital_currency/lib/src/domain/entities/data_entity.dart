///Entity for data
class DataEntity {
  ///Required parameters in this entity
  DataEntity({
    required this.base,
    required this.currency,
    required this.amount,
    required this.date,
  });

  ///Digital currency
  final String base;

  ///Current currency
  final String currency;

  ///Spot price
  final String amount;

  ///Consultation date of the currency
  String date;
}
