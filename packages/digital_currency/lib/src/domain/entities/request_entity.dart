/// Entity for requiest htpp
class RequestEntity {
  /// Both params may be optional
  const RequestEntity({this.requestDetails = false, this.date});

  /// Condition for get details of currency usd,eur,cop
  final bool requestDetails;

  /// Date for get specific data day from api
  final String? date;
}
