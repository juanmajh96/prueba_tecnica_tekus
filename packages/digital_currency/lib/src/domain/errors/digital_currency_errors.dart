///Interface for errors
abstract class DigitalCurrencyError implements Exception {}

///[DatasourceError] Throw when the external resource fails
class DatasourceError implements DigitalCurrencyError {
  ///It's get an optional error message
  const DatasourceError({this.messageError = ''});

  ///[messageError] can be null
  final String? messageError;
}

///[InternetError] Throw when there is not internet connection
class InternetError implements DigitalCurrencyError {
  ///It's get an optional error message
  const InternetError({this.messageError = ''});

  ///[messageError] can be null
  final String? messageError;
}
