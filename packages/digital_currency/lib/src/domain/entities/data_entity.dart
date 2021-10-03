///Entity for data
class DataEntity {
  ///Required parameters in this entity
  const DataEntity({
    required this.base,
    required this.currency,
    required this.amount,
  });

  ///Digital currency
  final String base;

  ///Current currency
  final String currency;

  ///Spot price
  final double amount;
}
