///Interface for errors
abstract class DigitalCurrencyError implements Exception {}

///[DatasourceError] Throw when the external resource fails
class DatasourceError implements DigitalCurrencyError {
  ///It's get an optional error message
  DatasourceError({this.messageError = ''});

  ///[messageError] can be null
  final String? messageError;
}
